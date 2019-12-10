class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @authors = []
    @books = []
  end

  def add_author(author)
    @authors << author
    @books += author.books
  end

  def publication_time_frame_for(author)
    { start: author.earliest_book.publication_year,
    end: author.latest_book.publication_year}
  end

  def checkout(book)
    @books.include?(book) && !book.checked_out ? book.checkout : false
  end

  def return(book)
    book.return
  end

  def checked_out_books
    @books.find_all do |book|
      book.checked_out
    end
  end
end
