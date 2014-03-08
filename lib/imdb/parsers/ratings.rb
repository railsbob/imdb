module Imdb::Parsers
  class Ratings < Base

    REGEX = /^(\d\.\d)([^(]*)(\([\d]{4}\))(.*)/

    def parse(string)
      if match = string[27..-1].match(REGEX)
        Imdb::Movie.new(
          sanitize_name(match[2]),
          sanitize_rating(match[1]),
          sanitize_year(match[3]),
          sanitize_desc(match[4])
        )
      end
    end
  end
end