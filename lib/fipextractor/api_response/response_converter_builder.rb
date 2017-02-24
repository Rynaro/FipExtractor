module FipeApi
  require_relative 'response_converter'
  require_relative 'brand_response_converter'
  require_relative 'model_response_converter'
  require_relative 'model_through_year_response_converter'
  class ResponseConverterBuilder

    def self.build(method, fipe_response)
      case(method)
      when :brand
        FipeApi::BrandResponseConverter.new(method, fipe_response)
      when :model
        FipeApi::ModelResponseConverter.new(method, fipe_response)
      when :model_through_year
        FipeApi::ModelThroughYearResponseConverter.new(method, fipe_response)
      else
        FipeApi::ResponseConverter.new(method, fipe_response)
      end
    end

  end
end
