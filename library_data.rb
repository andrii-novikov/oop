authors = [
    Author.new('Ernest Hemingway','about Ernest Hemingway'),
    Author.new('Jack London','about Jack London'),
    Author.new('Пушкин А.С.','Биография пушкина')
]

books = [
    Book.new('Indian Camp', authors[0]),
    Book.new('Fifty Grand', authors[0]),
    Book.new('Adventure', authors[1]),
    Book.new('The Star Rover', authors[1]),
    Book.new('Hearts of Three', authors[1]),
    Book.new('Руслан и Людмила', authors[2]),
    Book.new('Евгений Онегин', authors[2]),
    Book.new('Русалка', authors[2]),
]

readers = [
    Reader.new('Andy Novikov', 'andruha2921@gmail.com'),
    Reader.new('Veronik Zubova', 'veronik@gmail.com'),
    Reader.new('Kazancev Max', 'max@gmail.com'),
]

orders = [
    Order.new(books[0],readers[0]),
    Order.new(books[1],readers[0]),
    Order.new(books[2],readers[0]),
    Order.new(books[3],readers[1]),
    Order.new(books[0],readers[2]),
]

library = Library.new

books.each { |book| library.add_book(book)}
authors.each { |a| library.add_author(a)}
orders.each { |o| library.add_order(o)}
readers.each { |r| library.add_reader(r)}

puts library.books
puts library.orders
puts library.readers
puts library.authors

library.save