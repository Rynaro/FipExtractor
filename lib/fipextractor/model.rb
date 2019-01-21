require_relative 'resource'
require_relative 'model_response'

module FipExtractor
  class Model < Resource
    attr_reader :vehicle_type, :reference_table_id, :brand_id

    def initialize(vehicle_type:, reference_table_id:, brand_id:)
      @vehicle_type = vehicle_type
      @reference_table_id = reference_table_id
      @brand_id = brand_id
    end

    def route
      'ConsultarModelos'
    end

    def params
      {
        codigoTipoVeiculo: vehicle_type_id,
        codigoTabelaReferencia: reference_table_id,
        codigoMarca: brand_id
      }
    end
  end
end
