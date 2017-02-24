module FipeApi
  require_relative 'api_requester'
  require_relative 'api_response'

  class ApiFactory

    def self.create_requester(method, params = {})
      ApiRequester.new(method, params)
    end

  end
end
