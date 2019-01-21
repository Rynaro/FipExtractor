require_relative 'request'
require_relative 'converter/vehicle_type'

module FipExtractor
  class Resource < Request
    def vehicle_type_id
      Converter::VehicleType.to_id(vehicle_type)
    end
  end
end
