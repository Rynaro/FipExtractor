require_relative 'resource'
require_relative 'vehicle_response'

module FipExtractor
  class Vehicle < Resource
    attr_reader :vehicle_type, :reference_table_id, :brand_id, :model_id, :year, :fuel

    def initialize(vehicle_type:, reference_table_id:, brand_id:, model_id:, year:, fuel:)
      @vehicle_type = vehicle_type
      @reference_table_id = reference_table_id
      @brand_id = brand_id
      @model_id = model_id
      @year = year
      @fuel = fuel
    end

    def route
      'ConsultarValorComTodosParametros'
    end

    def params
      {
        codigoTipoVeiculo: vehicle_type_id,
        codigoTabelaReferencia: reference_table_id,
        codigoModelo: model_id,
        codigoMarca: brand_id,
        anoModelo: year,
        codigoTipoCombustivel: fuel,
        tipoConsulta: search_type
      }
    end

    private

    def search_type
      'tradicional'.freeze
    end
  end
end
