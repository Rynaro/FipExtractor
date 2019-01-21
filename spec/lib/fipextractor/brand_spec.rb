RSpec.describe FipExtractor::Brand do
  subject { described_class.new(params) }
  let(:params) do
    {
      reference_table_id: 1,
      vehicle_type: :car
    }
  end

  describe '#route' do
    it do
      expect(subject.route).to eq('ConsultarMarcas')
    end
  end

  describe '#params' do
    it do
      expect(subject.params).to eq(      {
        codigoTipoVeiculo: 1,
        codigoTabelaReferencia: 1
      })
    end
  end
end
