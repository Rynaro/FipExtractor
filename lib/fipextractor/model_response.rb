require_relative 'response'

module FipExtractor
  class ModelResponse < Response

    def models
      all[:Modelos]
    end

    def years
      all[:Anos]
    end

  end
end
