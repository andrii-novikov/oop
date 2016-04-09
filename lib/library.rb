require 'book'
require 'order'
require 'reader'
require 'author'
require 'yaml'

class Library

  attr_reader :books, :orders, :readers, :authors

  DATA_DIR = "#{$PROJECT_DIR}/data"

  def initialize
    @books, @orders, @readers, @authors = [], [], [], []
  end

  def add_author(author)
    if author.is_a?(Author)
      @authors <<  author unless authors.include? author
    else
      raise ArgumentError.new('author must be instance of Author')
    end
  end

  def add_book(book)
    if book.is_a?(Book)
      @books <<  book unless books.include? book
      add_author(book.author)
    else
      raise ArgumentError.new('book must be instance of Book')
    end
  end

  def add_reader(reader)
    if reader.is_a?(Reader)
      @readers <<  reader unless readers.include? reader
    else
      raise ArgumentError.new('reader must be instance of Reader')
    end
  end

  def add_order(order)
    if order.is_a?(Order)
      if books.include? order.book
        @orders <<  order unless orders.include? order
        add_reader order.reader
      else
        raise ArgumentError.new("Library hasn't this book - #{order.book}")
      end
    else
      raise ArgumentError.new('order must be instance of Order')
    end
  end

  def to_s
    "Books:" +
    "\t#{books.join("\n\t")}"+

    "\n\nAuthors:\n" +
    "\t#{authors.join("\n\t")}" +

    "\n\nReaders:\n" +
    "\t#{readers.join("\n\t")}" +

    "\n\nOrders:\n" +
    "\t#{orders.join("\n\t")}"

  end

  def save
    instance_variables.each do |variable|
      dump = YAML.dump(self.instance_variable_get(variable))
      File.write("#{Library::DATA_DIR}/#{variable}.yml",dump)
    end
  end

  def load
    instance_variables.each do |variable|
      a = File.read("#{Library::DATA_DIR}/#{variable}.yml")
      self.instance_variable_set(variable, YAML.load(a))
    end
  end
end