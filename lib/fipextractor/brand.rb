require_relative 'resource'
require_relative 'brand_response'

module FipExtractor
  class Brand < Resource
    attr_reader :vehicle_type, :reference_table_id

    def initialize(vehicle_type:, reference_table_id:)
      @vehicle_type = vehicle_type
      @reference_table_id = reference_table_id
    end

    def route
      'ConsultarMarcas'
    end

    def params
      {
        codigoTipoVeiculo: vehicle_type_id,
        codigoTabelaReferencia: reference_table_id
      }
    end
  end
end
