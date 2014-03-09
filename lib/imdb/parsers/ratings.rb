module Imdb::Parsers
  class Ratings < Base

    REGEX = /^(\d\.\d)([^(]*)(\([\d]{4}\))(.*)/

    def parse(string)
      begin
        source = string[27..-1].encode!('UTF-8', 'UTF-8', :invalid => :replace)
        if match = source.match(REGEX)
          Imdb::Movie.new(
            sanitize_name(match[2]),
            sanitize_rating(match[1]),
            sanitize_year(match[3]),
            sanitize_desc(match[4])
          )
        end
      rescue
        nil
      end
    end
  end
end