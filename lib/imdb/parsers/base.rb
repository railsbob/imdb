require 'open3'

module Imdb::Parsers
  class Base
    attr_accessor :path, :term

    def initialize(path)
      @path = path
    end

    def search(term)
      [].tap do |results|
        Open3.popen3(command(term)) do |stdin, stdout, stderr|
          stdout.each_line do |l|
            movie = parse(l)
            results << movie if movie
          end
        end
      end
    end

    # Override
    def parse(text)
      text
    end

    private

    def command(term)
      "grep '#{ term }' -i #{ path }"
    end

    def sanitize_name(string)
      string.strip if string
    end

    def sanitize_rating(value)
      value.to_f if value
    end

    def sanitize_year(string)
      year = string.gsub(/\(|\)/, '')
      year.to_i if year
    end

    def sanitize_desc(string)
      if string
        string.gsub(/\{|\}/, '').strip
      end
    end
  end
end