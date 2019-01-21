RSpec.describe FipExtractor::ReferenceTable do
  subject { described_class.new }

  describe '#route' do
    it do
      expect(subject.route).to eq('ConsultarTabelaDeReferencia')
    end
  end
end
