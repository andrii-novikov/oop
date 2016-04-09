class Book
  attr_reader :title, :author

  def initialize(title, author)
    @title, @author = title, author
  end

  def to_s
    "#{title}(#{author})"
  end

  def ==(other)
    if other.is_a? Book
      title == other.title && author == other.author
    else
      false
    end
  end
end