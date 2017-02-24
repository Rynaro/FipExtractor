module FipeApi
  class ParameterValidator

    attr_reader :status, :message

    PARAMETERS = %w{reference_table_id vehicle_type brand_id model_id year model_year fuel_type_id vehicle_type}

    METHOD_PARAMS = {
      reference_table: {},
      brand: PARAMETERS.select { |param| param.match(/reference_table_id|vehicle_type/) },
      model: PARAMETERS.select { |param| param.match(/reference_table_id|vehicle_type|brand_id/) },
      model_year: PARAMETERS.select { |param| param.match(/reference_table_id|vehicle_type|brand_id|model_id/) },
      model_through_year: PARAMETERS.select { |param| param.match(/reference_table_id|vehicle_type|brand_id|model_id|year|model_year|fuel_type_id/) },
      full: PARAMETERS
    }

    def initialize(method, params)
      @method = method
      @params = params
      @message = []
      validate
    end

    def is_ok?
      @status
    end

    private

    def validate
      METHOD_PARAMS[@method].each do |param|
        @message.push("#{param} does not exists, and is mandatory for #{@method} method!") unless param_exists?(param)
      end
      generate_status
    end

    def param_exists?(param)
      @params.has_key?(param.to_sym)
    end

    def generate_status
      @status = @message.empty?
    end

  end
end
