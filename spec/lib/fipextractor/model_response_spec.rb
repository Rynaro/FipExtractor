RSpec.describe FipExtractor::ModelResponse do
  subject { described_class.new(raw_response) }
  let(:raw_response) do
    double(
      :raw_response,
      status: 200,
      body: {
        'Modelos' => [
          { 'name' => 'car1' },
          { 'name' => 'car2' }
        ],
        'Anos' => [
          '1999',
          '2000'
        ]
      }.to_json
    )
  end

  describe '#models' do
    it do
      expect(subject.models).to eq([
        { name: 'car1' },
        { name: 'car2' }
      ])
    end
  end

  describe '#years' do
    it { expect(subject.years).to eq(['1999','2000']) }
  end
end
