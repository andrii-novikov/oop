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