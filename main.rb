require_relative 'database'
require_relative 'movie'

def main
  database = Database.new

  loop do
    puts "\n--- Movie Database ---"
    puts "1. Add a Movie"
    puts "2. Remove a Movie"
    puts "3. List All Movies"
    puts "4. Add a Review to a Movie"
    puts "5. Add a Rating to a Movie"
    puts "6. Exit"
    print "Choose an option: "
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
      puts "Exiting program..."
      break
    else
      puts "Invalid option. Please try again."
    end
  end
end

def add_movie(database)
  print "Enter movie title: "
  title = gets.chomp
  print "Enter movie director: "
  director = gets.chomp
  database.add_movie(Movie.new(title, director))
  puts "'#{title}' added to the database."
end

def remove_movie(database)
  print "Enter the title of the movie to remove: "
  title = gets.chomp
  if database.remove_movie(title)
    puts "'#{title}' removed from the database."
  else
    puts "Movie not found."
  end
end

def list_movies(database)
  puts "\nMovies in Database:"
  database.list_movies
end