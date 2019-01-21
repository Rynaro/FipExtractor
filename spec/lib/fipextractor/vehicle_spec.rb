RSpec.describe FipExtractor::Vehicle do
  subject { described_class.new(params) }
  let(:params) do
    {
      reference_table_id: 1,
      brand_id: 1,
      model_id: 1,
      year: 1999,
      fuel: 1,
      vehicle_type: :car
    }
  end

  describe '#route' do
    it do
      expect(subject.route).to eq('ConsultarValorComTodosParametros')
    end
  end

  describe '#params' do
    it do
      expect(subject.params).to eq({
        codigoTipoVeiculo: 1,
        codigoTabelaReferencia: 1,
        codigoModelo: 1,
        codigoMarca: 1,
        anoModelo: 1999,
        codigoTipoCombustivel: 1,
        tipoConsulta: 'tradicional'
      })
    end
  end
end
