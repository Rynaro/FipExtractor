module FipeApi
  class ApiResponse

    attr_reader :response

    def initialize(method, response)
      @method = method
      @response = convert_response_receipt(response)
    end

    def valid_response?
      !@response.has_key?(:fipe_error_message)
    end

    private

    def convert_response_receipt(response)
      converter = FipeApi::ResponseConverterBuilder.build(@method, response)
      converter.convert
    end

  end
end
