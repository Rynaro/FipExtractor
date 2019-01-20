RSpec.describe FipExtractor::Request do
  subject { described_class.new }

  describe '#call' do
    let(:response_class) { double(:response_class) }
    let(:request) { double(:request) }

    before do
      expect(subject).to receive_messages(response_class: response_class, request: request)
      expect(response_class).to receive(:new).with(request).and_return(response)
    end

    context 'successfully response' do
      let(:response) { double(:response, error?: false) }
      it do
        expect(subject.call).to eq(response)
      end
    end

    context 'unsuccessfully response' do
      let(:response) { double(:response, error?: true) }
      it do
        expect { subject.call }.to(
          raise_error(FipExtractor::ResourceNotFoundError)
        )
      end
    end
  end

  describe '#request' do
    let(:request_instance) { double(:request_instance, post: true) }
    let(:resource) { 'resource' }
    let(:headers) { 'headers' }
    let(:route) { 'route' }

    it do
      allow(subject).to receive(:route).and_return(route)
      allow(subject).to receive(:resource).and_return(resource)
      allow(subject).to receive(:headers).and_return(headers)
      expect(Faraday).to(
        receive(:new)
        .with(url: resource, headers: headers)
        .and_return(request_instance)
      )
      subject.request
    end
  end

  describe '#params' do
    it { expect(subject.params).to eq({}) }
  end

  describe '#resource' do
    it do
      expect(subject).to receive(:route).and_return('resource_route')
      expect(subject.resource).to eq('https://veiculos.fipe.org.br/api/veiculos/resource_route')
    end
  end

  describe '#route' do
    it { expect{ subject.route }.to raise_error(FipExtractor::RouteNotFoundError) }
  end

  describe '#base_url' do
    it do
      expect(subject.base_url).to eq("https://veiculos.fipe.org.br/api/veiculos")
    end
  end

  describe '#response_class' do
    it do
      stub_const('FipExtractor::RequestResponse', Class.new)
      expect(subject).to receive(:class).and_return(FipExtractor::Request)
      expect(subject.response_class).to eq(FipExtractor::RequestResponse)
    end
  end

end
