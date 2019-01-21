RSpec.describe FipExtractor::Response do
  subject { described_class.new(raw_response) }

  describe '#status' do
    context 'failed response' do
      let(:raw_response) do
        double(:raw_response, status: 403, body: { 'error' => 'error' }.to_json)
      end

      it { expect(subject.error?).to eq(true) }
    end

    context 'successful response' do
      let(:raw_response) do
        double(:raw_response, status: 200, body: {}.to_json)
      end

      it { expect(subject.error?).to eq(false) }
    end
  end
end
