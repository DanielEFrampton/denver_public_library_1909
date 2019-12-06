class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @authors = []
  end

  def books
    @authors.flat_map { |author| author.books }
  end

  def add_author(author)
    @authors << author
  end

  def publication_time_frame_for(author)
    { start: author.earliest_book.publication_year,
    end: author.latest_book.publication_year}
  end
end
