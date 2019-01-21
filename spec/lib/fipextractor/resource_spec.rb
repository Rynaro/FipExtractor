RSpec.describe FipExtractor::Resource do
  subject { described_class.new }

  describe '#vehicle_type_id' do
    let(:vehicle_type) { :car }

    it do
      expect(subject).to receive(:vehicle_type).and_return(vehicle_type)
      expect(subject.vehicle_type_id).to eq(1)
    end
  end
end
