require_relative 'response'

module FipExtractor
  class VehicleResponse < Response
    alias_method :details, :all
  end
end
