require_relative 'request'
require_relative 'brand_response'

module FipExtractor
  class Brand < Request
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
        codigoTipoVeiculo: vehicle_type,
        codigoTabelaReferencia: reference_table_id
      }
    end
  end
end
