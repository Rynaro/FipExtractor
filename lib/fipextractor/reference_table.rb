require_relative 'request'
require_relative 'reference_table_response'

module FipExtractor
  class ReferenceTable < Request
    def route
      'ConsultarTabelaDeReferencia'
    end
  end
end
