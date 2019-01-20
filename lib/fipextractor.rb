# require_relative 'fipextractor/fipe_api/api_factory'
# require_relative 'fipextractor/api_parameter/parameter_converter'
# require_relative 'fipextractor/api_parameter/parameter_validator'
# require_relative 'fipextractor/api_response/response_converter_builder'

require 'fipextractor/reference_table'
require 'fipextractor/brand'
require 'fipextractor/model'
require 'fipextractor/model_year'

module FipExtractor
end

# class FipExtractor

#   attr_accessor :method, :parameters

#   def initialize(method, parameters = {})
#     @method = method
#     @parameters = parameters
#   end

#   def validate_parameters
#     FipeApi::ParameterValidator.new(@method, @parameters)
#   end

#   def request
#     @parameters = convert_parameters_to_api_pattern(@parameters)
#     FipeApi::ApiFactory.create_requester(@method, @parameters)
#   end

#   private

#   def convert_parameters_to_api_pattern(parameters)
#     parameters[:vehicle_type] = convert_humanized_vehicle_id(parameters[:vehicle_type])
#     parameters[:search] = add_non_obstrutive_search_type if @method == :full
#     FipeApi::ParameterConverter.to_fipe_pattern(parameters)
#   end

#   def convert_humanized_vehicle_id(vehicle_type)
#     FipeApi::ParameterConverter.vehicle_type_to_id(vehicle_type)
#   end

#   def add_non_obstrutive_search_type
#     'tradicional'
#   end

# end
