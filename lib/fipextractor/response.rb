require 'json'

module FipExtractor
  class Response
    attr_reader :status, :all

    def initialize(raw)
      @status = raw.status
      @all = JSON.parse(raw.body, symbolize_names: true)
    end

    def error?
      status >= 400
    end
  end
end
