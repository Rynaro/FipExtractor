require 'unirest'
require 'net/http'
require 'json'

module FipeApi
  class ApiRequester

    API_METHOD = {
      reference_table:     "/ConsultarTabelaDeReferencia",
      brand:               "/ConsultarMarcas",
      model:               "/ConsultarModelos",
      model_year:          "/ConsultarAnoModelo",
      model_through_year:  "/ConsultarModelosAtravesDoAno",
      full:                "/ConsultarValorComTodosParametros" }

    FIPE_URL = "http://veiculos.fipe.org.br"
    FIPE_API = "/api/veiculos"

    def initialize(method, parameters)
      @method = method
      @parameters = parameters
    end

    def send
      response = Unirest.post(api_request_url, headers: configure_header, parameters: @parameters)
      FipeApi::ApiResponse.new(@method, response.body)
    end

    private

    def api_request_url
      "#{FIPE_URL + FIPE_API + API_METHOD[@method]}"
    end

    def configure_header
      { 'Host'              => FIPE_URL.gsub("http://", ""),
        # 'User-Agent'        => 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0',
        # 'Accept'            => 'application/json, text/javascript, */*; q=0.01',
        # 'Accept-Language'   => 'pt-BR,pt;q=0.8,en-US;q=0.5,en;q=0.3',
        # 'Accept-Encoding'   => 'gzip, deflate',
        # 'Content-Type'      => 'text/plain; charset=UTF-8',
        # 'X-Requested-With'  => 'XMLHttpRequest',
        # 'Pragma'            => 'no-cache',
        # 'Cache-Control'     => 'max-age=0',
        'Referer'           => "#{FIPE_URL}/",
        # 'Connection'        => 'keep-alive' 
      }
    end
  end
end
