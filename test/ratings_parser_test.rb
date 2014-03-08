require 'test_helper'

class RatingsParserTest < Minitest::Test

  def test_ratings
    file = ::Imdb::Parsers::Ratings.new('/Users/railsbob/work/imdb/test/fixtures/ratings.list')
    movies = file.search('the lord of the rings')
    assert_equal 3, movies.length

    assert_equal "The Lord of the Rings: The Return of the King", movies[0].name
    assert_equal 8.9, movies[0].rating
    assert_equal 2003, movies[0].year
  end
end