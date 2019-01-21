require_relative 'resource'
require_relative 'model_year_response'

module FipExtractor
  class ModelYear < Resource
    attr_reader :vehicle_type, :reference_table_id, :brand_id, :model_id

    def initialize(vehicle_type:, reference_table_id:, brand_id:, model_id:)
      @vehicle_type = vehicle_type
      @reference_table_id = reference_table_id
      @brand_id = brand_id
      @model_id = model_id
    end

    def route
      'ConsultarAnoModelo'
    end

    def params
      {
        codigoTipoVeiculo: vehicle_type_id,
        codigoTabelaReferencia: reference_table_id,
        codigoMarca: brand_id,
        codigoModelo: model_id
      }
    end
  end
end
