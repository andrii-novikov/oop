require 'book'
require 'reader'

class Order
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Time.now)
    @book, @reader, @date =
        book, reader, date
  end

  def ==(other)
    if other.is_a? Order
      book == other.book && reader == other.reader
    else
      false
    end
  end

  def to_s
    "#{reader.name} takes #{book} #{date}"
  end
end