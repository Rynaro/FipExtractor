require_relative 'resource'
require_relative 'model_through_year_response'

module FipExtractor
  class ModelThroughYear < Resource
    attr_reader :vehicle_type, :reference_table_id, :brand_id, :model_id, :year, :fuel

    def initialize(vehicle_type:, reference_table_id:, brand_id:, model_id:, year:, fuel: nil)
      @vehicle_type = vehicle_type
      @reference_table_id = reference_table_id
      @brand_id = brand_id
      @model_id = model_id
      @year = year
      @fuel = fuel
    end

    def route
      'ConsultarModelosAtravesDoAno'
    end

    def params
      {
        codigoTipoVeiculo: vehicle_type_id,
        codigoTabelaReferencia: reference_table_id,
        codigoMarca: brand_id,
        anoModelo: year,
        codigoTipoCombustivel: fuel
      }
    end
  end
end
