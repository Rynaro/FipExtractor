RSpec.describe FipExtractor::Converter::VehicleType do
  describe '#to_id' do
    context 'car type' do
      it { expect(described_class.to_id(:car)).to eq(1) }
    end

    context 'car type' do
      it { expect(described_class.to_id(:motorcycle)).to eq(2) }
    end

    context 'car type' do
      it { expect(described_class.to_id(:truck)).to eq(3) }
    end

    context 'integer scoped' do
      it { expect(described_class.to_id(1)).to eq(1) }
    end
  end
end
