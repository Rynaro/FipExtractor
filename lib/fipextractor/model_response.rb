require_relative 'response'

module FipExtractor
  class ModelResponse < Response

    def list
      body[:Modelos]
    end

  end
end
