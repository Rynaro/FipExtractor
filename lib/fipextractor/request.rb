require 'faraday'
require_relative 'response'

module FipExtractor
  class RouteNotFoundError < StandardError; end

  class Request
    HOST = "veiculos.fipe.org.br".freeze
    API = "api/veiculos".freeze

    def call
      response_class.new(request).tap do |response|
        raise("Operation Error #{response.body}") if response.error?
      end
    end

    def response_class
      Object.const_get("#{self.class}Response")
    end

    def request
      Faraday.new(url: resource, headers: headers).send(:post) do |request|
        request.body = params
      end
    end

    def base_url
      "https://#{HOST}/#{API}"
    end

    def route
      raise RouteNotFoundError
    end

    def resource
      "#{base_url}/#{route}"
    end

    def params
      {}
    end

    private

    def headers
      {
        'Host' => HOST,
        'Referer' => "https://#{HOST}"
      }
    end
  end
end
