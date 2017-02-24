module FipeApi
  class ParameterConverter

    CONVERSION_PARAMETER = {
      reference_table_id: :codigoTabelaReferencia,
      vehicle_type_id: :codigoTipoVeiculo,
      brand_id: :codigoMarca,
      model_id: :codigoModelo,
      year: :ano,
      model_year: :anoModelo,
      fuel_type_id: :codigoTipoCombustivel,
      search: :tipoConsulta,
      vehicle_type: :codigoTipoVeiculo
    }

    VEHICLE_TYPE = {
      car: 1,
      motorcycle: 2,
      truck: 3
    }

    def self.to_fipe_pattern(application_parameters)
      converted_parameters = {}
      application_parameters.each do |parameter, value|
        converted_parameters[CONVERSION_PARAMETER[parameter]] = value
      end
      converted_parameters
    end

    def self.vehicle_type_to_id(vehicle)
      VEHICLE_TYPE[vehicle]
    end

    def self.add_search_type
      'tradicional'
    end

  end
end
