RSpec.describe FipExtractor::ModelThroughYear do
  subject { described_class.new(params) }
  let(:params) do
    {
      reference_table_id: 1,
      brand_id: 1,
      model_id: 1,
      year: 1999,
      vehicle_type: :car
    }
  end

  describe '#route' do
    it do
      expect(subject.route).to eq('ConsultarModelosAtravesDoAno')
    end
  end

  describe '#params' do
    context 'without fuel' do
      it do
        expect(subject.params).to eq({
          codigoTipoVeiculo: 1,
          codigoTabelaReferencia: 1,
          codigoMarca: 1,
          anoModelo: 1999,
          codigoTipoCombustivel: nil
        })
      end

      context 'with fuel' do
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

        it do
          expect(subject.params).to eq({
            codigoTipoVeiculo: 1,
            codigoTabelaReferencia: 1,
            codigoMarca: 1,
            anoModelo: 1999,
            codigoTipoCombustivel: 1
          })
        end
      end
    end
  end
end
