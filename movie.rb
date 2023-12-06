require_relative 'review'
require_relative 'rating'

class Movie
  attr_accessor :title, :director, :reviews, :ratings

  def initialize(title, director)
    @title = title
    @director = director
    @reviews = []
    @ratings = []
  end

  def add_review(author, content)
    @reviews << Review.new(author, content)
  end

  def add_rating(score, reviewer)
    @ratings << Rating.new(score, reviewer)
  end

  def average_rating
    return 0 if @ratings.empty?
    @ratings.sum(&:score) / @ratings.size.to_f
  end

  def to_s
    <<~MOVIE_DETAILS
      Title: #{@title}
      Director: #{@director}
      Average Rating: #{average_rating.round(2)}/10
      Reviews: 
      #{reviews.map(&:to_s).join("\n")}
      Ratings: 
      #{ratings.map(&:to_s).join("\n")}
    MOVIE_DETAILS
  end
end
