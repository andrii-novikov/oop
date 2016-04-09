$PROJECT_DIR = __dir__;
$LOAD_PATH << "#{$PROJECT_DIR}"
$LOAD_PATH << "#{$PROJECT_DIR}/lib"
require 'library'
require 'json'
# require 'library_data'

l= Library.new

l.load

puts l

puts l.who_often_takes_the_book