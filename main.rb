require_relative 'database'
require_relative 'movie'

def main
  database = Database.new

  loop do
    puts "\n--- Movie Database ---"
    puts '1. Add a Movie'
    puts '2. Remove a Movie'
    puts '3. List All Movies'
    puts '4. Add a Review to a Movie'
    puts '5. Add a Rating to a Movie'
    puts '6. Exit'
    print 'Choose an option: '
    choice = gets.chomp.to_i

    case choice
    when 1
      add_movie(database)
    when 2
      remove_movie(database)
    when 3
      list_movies(database)
    when 4
      add_review(database)
    when 5
      add_rating(database)
    when 6
      puts 'Exiting program...'
      break
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

def add_movie(database)
  print 'Enter movie title: '
  title = gets.chomp
  print 'Enter movie director: '
  director = gets.chomp
  database.add_movie(Movie.new(title, director))
  puts "'#{title}' added to the database."
end

def remove_movie(database)
  print 'Enter the title of the movie to remove: '
  title = gets.chomp
  if database.remove_movie(title)
    puts "'#{title}' removed from the database."
  else
    puts 'Movie not found.'
  end
end

def list_movies(database)
  puts "\nMovies in Database:"
  database.list_movies
end

def add_review(database)
  print 'Enter the title of the movie to review: '
  title = gets.chomp
  movie = database.find_movie(title)

  if movie
    print 'Enter your name: '
    author = gets.chomp
    print 'Enter your review: '
    content = gets.chomp
    movie.add_review(author, content)
    puts "Review added to '#{movie.title}'."
  else
    puts 'Movie not found.'
  end
end

def add_rating(database)
  print 'Enter the title of the movie to rate: '
  title = gets.chomp
  movie = database.find_movie(title)

  if movie
    print 'Enter your name: '
    reviewer = gets.chomp
    print 'Enter your rating (0-10): '
    score = gets.chomp.to_i
    movie.add_rating(score, reviewer)
    puts "Rating added to '#{movie.title}'."
  else
    puts 'Movie not found.'
  end
end

main
