class Review
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def to_s
    "Review by #{author}: #{content}"
  end
end