module FipeApi
  class ModelResponseConverter < ResponseConverter

    CONVERSION_TEMPLATE = {
      Label: :model,
      Value: :model_id
    }

    YEAR_CONVERSION_TEMPLATE = {
      Label: :year,
      Value: :year_fuel
    }

    def convert
      converted_hash_collection = {}
      converted_hash_collection[:models] = convert_by_object_type(@fipe_response['Modelos'])
      converted_hash_collection[:year] = convert_fuel_collection(@fipe_response['Anos'])
      converted_hash_collection
    end

    private

    def convert_fuel_collection(fipe_fuel_collection)
      converted_collection = []
      fipe_fuel_collection.each do |item|
        converted_collection.push(convert_by_fuel_pattern(item))
      end
      converted_collection
    end

    def convert_by_fuel_pattern(fipe_fuel_response)
      converted_item = {}
      fipe_fuel_response.each do |parameter, value|
        converted_item[:fuel_type_id] = extract_fuel_id(value) if (parameter.to_sym == :Value)
        converted_item[YEAR_CONVERSION_TEMPLATE[parameter.to_sym]] = value
      end
      converted_item
    end

    def extract_fuel_id(fuel_item)
      fuel_item.split('-').last
    end

  end
end
