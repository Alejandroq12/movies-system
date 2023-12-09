require_relative 'movie'

class Database
  def initialize
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
  end

  def remove_movie(title)
    @movies.reject! { |movie| movie.title == title }
  end

  def find_movie(title)
    @movies.find { |movie| movie.title == title }
  end

  def list_movies
    @movies.each { |movie| puts movie }
  end
end
