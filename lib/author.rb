class Author

  attr_reader :name, :biography

  def initialize(name, biography)
    @name, @biography = name, biography
  end

  def to_s
    "#{name}"
  end

  def ==(other)
    if other.is_a? Author
      name == other.name
    else
      false
    end
  end
end