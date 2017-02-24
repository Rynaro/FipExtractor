module FipeApi
  class ResponseConverter

    CONVERSION_TEMPLATE = {
      Codigo: :reference_table_id,
      Mes: :reference_table_month,
      Label: :label,
      Value: :value_id,
      Valor: :cost ,
      Marca: :brand,
      Modelo: :model,
      AnoModelo: :model_year,
      Combustivel: :fuel,
      CodigoFipe: :fipe_id,
      MesReferencia: :reference_month,
      Autenticacao: :authentication_hash,
      TipoVeiculo: :vehicle_type,
      SiglaCombustivel: :fuel_symbol,
      DataConsulta: :query_date,
      codigo: :request_fipe_code,
      erro: :fipe_error_message
    }

    def initialize(method, fipe_response)
      @method = method
      @fipe_response = fipe_response
    end

    def convert
      convert_by_object_type(@fipe_response)
    end

    private

    def convert_by_object_type(response_object)
      if response_object.is_a?(Array)
        collection_of_items(response_object)
      else
        convert_item(response_object)
      end
    end

    def convert_item(item)
      converted_item = {}
      item.each do |parameter, value|
        converted_item[self.class::CONVERSION_TEMPLATE[parameter.to_sym]] = value
      end
      converted_item
    end

    def collection_of_items(response_collection)
      converted_collection = []
      response_collection.each do |item|
        converted_collection.push(convert_item(item))
      end
      converted_collection
    end

  end
end
