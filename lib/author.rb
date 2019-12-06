class Author
  attr_reader :books

  def initialize(author_info)
    @books = []
    @first_name = author_info[:first_name]
    @last_name = author_info[:last_name]
  end

  def name
    @first_name + ' ' + @last_name
  end

  def write(title, date)
    @books << Book.new({title: title,
              date: date,
              author_first_name: @first_name,
              author_last_name: @last_name})
    @books.last
  end
end