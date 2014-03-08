module Imdb
  class Parser

    def initialize(type, path)
      case type
      when :ratings
        @ratings = ::Imdb::Parsers::Ratings.new(path)
      end
    end

    def ratings(query)
      @parser.search(query)
    end
  end
end