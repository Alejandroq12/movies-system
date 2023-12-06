class Rating
  attr_accessor :score, :reviewer

  def initialize(score, reviewer)
    @score = score
    @reviewer = reviewer
  end

  def to_s
    "Rating: #{score}/10 by #{reviewer}"
  end
end
