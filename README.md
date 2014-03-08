# Imdb

This gem allows you to parse the plain text IMDB data files. The files can be obtained from http://www.imdb.com/interfaces.

## Usage

		parser = Imdb::Parser.new(:ratings, '/path/to/ratings.list')
		movies = parser.search 'the lord of the rings'
		
		movies.length
		#=> 3
		
		movies[0].name
		#=> The Lord of the Rings: The Return of the King
		
		movies[0].rating
		#=> 8.9
		
		movies[0].year
		#=> 2003

