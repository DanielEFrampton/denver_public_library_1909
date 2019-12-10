class Book
  attr_reader :title, :checkouts, :checked_out

  def initialize(book_info)
    @title = book_info[:title]
    @author_first_name = book_info[:author_first_name]
    @author_last_name = book_info[:author_last_name]
    @publication_date = book_info[:publication_date]
    @checkouts = 0
    @checked_out = false
  end

  def author
    @author_first_name + ' ' + @author_last_name
  end

  def publication_year
    @publication_date.slice(-4, 4)
  end

  def add_checkout
    @checkouts += 1
  end

  def checkout
    add_checkout
    @checked_out = true
  end

  def return
    @checked_out = false
  end
end
