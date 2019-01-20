require_relative 'response'

module FipExtractor
  class ModelResponse < Response

    def models
      body[:Modelos]
    end

    def years
      body[:Anos]
    end

  end
end
