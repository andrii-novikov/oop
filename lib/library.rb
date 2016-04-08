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

  def add_author(author, biography = "")
    author = Author.new(author,biography) unless author.is_a? (Author)
    @authors <<  author unless authors.include? author
  end

  def save
    instance_variables.each do |variable|
      dump = YAML.dump(self.instance_variable_get(variable))
      File.write("#{Library::DATA_DIR}/#{variable}",dump)
    end
  end

  def load
    instance_variables.each do |variable|
      a = File.read("#{Library::DATA_DIR}/#{variable}")
      self.instance_variable_set(variable, YAML.load(a))
    end
  end
end