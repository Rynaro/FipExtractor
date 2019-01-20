module FipExtractor
  module Converter
    class VehicleType
      REMOTE_TYPE = {
        car: 1,
        motorcycle: 2,
        truck: 3,
      }

      def self.to_id(type)
        return type if type.is_a?(Integer)
        REMOTE_TYPE[type]
      end
    end
  end
end
