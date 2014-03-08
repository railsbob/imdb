module Imdb
  class Movie < ::Struct.new(:name, :rating, :year, :desc)
  end
end