require 'minitest/autorun'
require_relative '../lib/fipextractor/api_parameter/parameter_validator'

describe FipeApi::ParameterValidator do

  it "should reference_table pass through validation" do
    validator = FipeApi::ParameterValidator.new(:reference_table, {})
    validator.is_ok?.must_equal true
  end

  it "should have valid parameters for brand method" do
    validator = FipeApi::ParameterValidator.new(:brand, {reference_table_id: 189, vehicle_type: :truck})
    validator.is_ok?.must_equal true
  end

  it "should have invalid parameters for brand method" do
    validator = FipeApi::ParameterValidator.new(:brand, {reference_table_id: 189})
    validator.is_ok?.must_equal false
  end

  it "should have valid parameters for model method" do
    validator = FipeApi::ParameterValidator.new(:model, {reference_table_id: 189, vehicle_type: :truck, brand_id: 102})
    validator.is_ok?.must_equal true
  end

  it "should have invalid parameters for model method" do
    validator = FipeApi::ParameterValidator.new(:model, {reference_table_id: 189, vehicle_type: :truck})
    validator.is_ok?.must_equal false
  end

  it "should have valid parameters for model_year method" do
    validator = FipeApi::ParameterValidator.new(:model_year, {reference_table_id: 189, vehicle_type: :truck, brand_id: 102, model_id: 6704})
    validator.is_ok?.must_equal true
  end

  it "should have invalid parameters for model_year method" do
    validator = FipeApi::ParameterValidator.new(:model_year, {reference_table_id: 189, vehicle_type: :truck, brand_id: 102})
    validator.is_ok?.must_equal false
  end

  it "should have valid parameters for model_through_year method" do
    validator = FipeApi::ParameterValidator.new(:model_through_year, {reference_table_id: 205, vehicle_type: :car, brand_id: 3, model_id: 7, year: '1997-1', model_year: '1997', fuel_type_id: 1})
    validator.is_ok?.must_equal true
  end

  it "should have invalid parameters for model_through_year method" do
    validator = FipeApi::ParameterValidator.new(:model_through_year, {reference_table_id: 205, vehicle_type: :car, brand_id: 3, model_id: 7, year: '1997-1'})
    validator.is_ok?.must_equal false
  end

  it "should have valid parameters for full method" do
    validator = FipeApi::ParameterValidator.new(:full, {reference_table_id: 189, vehicle_type: :car, brand_id: 3, model_id: 7, model_year: "1999", year: "1999", fuel_type_id: 1})
    validator.is_ok?.must_equal true
  end

  it "should have invalid parameters for full method" do
    validator = FipeApi::ParameterValidator.new(:full, {reference_table_id: 189, vehicle_type: :car, brand_id: 3, model_id: 7, model_year: "1999", year: "1999"})
    validator.is_ok?.must_equal false
  end

  it "should have invalid parameters reports with a array of messages" do
    validator = FipeApi::ParameterValidator.new(:model_through_year, {reference_table_id: 205, vehicle_type: :car, brand_id: 3, model_id: 7, year: '1997-1'})
    validator.message.must_equal ["model_year does not exists, and is mandatory for model_through_year method!", "fuel_type_id does not exists, and is mandatory for model_through_year method!"]
  end


end
