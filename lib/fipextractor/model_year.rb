require_relative 'request'
require_relative 'model_response'

module FipExtractor
  class ModelYear < Request
    attr_reader :vehicle_type, :reference_table_id, :brand_id, :model_id

    def initialize(vehicle_type:, reference_table_id:, brand_id:, model_id:)
      @vehicle_type = vehicle_type
      @reference_table_id = reference_table_id
      @brand_id = brand_id
      @model_id = model_id
    end

    def route
      'ConsultarModelos'
    end

    def params
      {
        codigoTipoVeiculo: vehicle_type,
        codigoTabelaReferencia: reference_table_id,
        codigoMarca: brand_id
      }
    end
  end
end
