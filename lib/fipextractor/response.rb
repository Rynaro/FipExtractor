require 'json'

module FipExtractor
  class Response
    attr_reader :status, :body

    def initialize(raw)
      @status = raw.status
      @body = JSON.parse(raw.body, symbolize_names: true)
    end

    def error?
      status >= 400
    end
  end
end
