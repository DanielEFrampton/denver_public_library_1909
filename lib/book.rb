class Book
  attr_reader :title

  def initialize(book_info)
    @title = book_info[:title]
    @author_first_name = book_info[:author_first_name]
    @author_last_name = book_info[:author_last_name]
    @publication_date = book_info[:publication_date]
  end

  def author
    @author_first_name + ' ' + @author_last_name
  end

  def publication_year
    @publication_date.slice(-4, 4)
  end
end
