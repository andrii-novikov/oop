$PROJECT_DIR = __dir__;
$LOAD_PATH << "#{$PROJECT_DIR}"
$LOAD_PATH << "#{$PROJECT_DIR}/lib"
require 'library'
require 'json'
# require 'library_data'

l= Library.new

l.load

puts 'Library:'
puts l

puts "\nWho often takes the book?"
puts l.who_often_takes_the_book

puts "\nWhat is the most popular book"
puts l.most_popular_book

puts "\nHow many people ordered one of the three most popular books"
puts l.users_takes_popular_book