require 'minitest/autorun'
require_relative '../lib/fipextractor/api_parameter/parameter_converter'

describe FipeApi::ParameterConverter do

  it "should parameters of full method would be converted" do
    parameters = { reference_table_id: 189, vehicle_type: 1, brand_id: 3, model_id: 7, model_year: "1999", year: "1999", fuel_type_id: 1 }
    FipeApi::ParameterConverter.to_fipe_pattern(parameters).must_equal({
      codigoTabelaReferencia: 189,
      codigoTipoVeiculo: 1,
      codigoMarca: 3,
      codigoModelo: 7,
      anoModelo: "1999",
      ano: "1999",
      codigoTipoCombustivel: 1 })
  end

  it "should vehicle_type :car converted to value 1" do
    FipeApi::ParameterConverter.vehicle_type_to_id(:car).must_equal 1
  end


end
