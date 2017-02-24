require 'minitest/autorun'
require_relative '../lib/fipextractor/api_response/response_converter_builder'

describe FipeApi::ResponseConverter do

  it "should response of full method converted to application pattern" do
    response ={
      "Valor"=>"R$ 15.577,00",
      "Marca"=>"Alfa Romeo",
      "Modelo"=>"145 Quadrifoglio 2.0",
      "AnoModelo"=>1999,
      "Combustivel"=>"Gasolina",
      "CodigoFipe"=>"006002-0",
      "MesReferencia"=>"março de 2016 ",
      "Autenticacao"=>"fictional_hash",
      "TipoVeiculo"=>1,
      "SiglaCombustivel"=>"G",
      "DataConsulta"=>"quarta-feira, 22 de fevereiro de 2017 22:35" }
    converter = FipeApi::ResponseConverterBuilder.build(:full, response)
    converter.convert.must_equal({
      cost: "R$ 15.577,00",
      brand: "Alfa Romeo",
      model: "145 Quadrifoglio 2.0",
      model_year: 1999,
      fuel: "Gasolina",
      fipe_id: "006002-0",
      reference_month: "março de 2016 ",
      authentication_hash: "fictional_hash",
      vehicle_type: 1,
      fuel_symbol: "G",
      query_date: "quarta-feira, 22 de fevereiro de 2017 22:35" })
  end

end
