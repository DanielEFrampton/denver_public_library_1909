require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({
                                    first_name: "Charlotte",
                                    last_name: "Bronte"
                                  })
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_can_return_author_full_name
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
  end

  def test_it_can_return_books_by_author
    assert_equal [], @charlotte_bronte.books
  end

  def test_it_can_write_a_book_added_to_books
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")

    assert_equal Book, jane_eyre.class
    assert_equal "Jane Eyre", jane_eyre.title

    villette = @charlotte_bronte.write("Villette", "1853")
    assert_equal [jane_eyre, villette], @charlotte_bronte.books
  end

  def test_it_can_return_earliest_book
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    villette = @charlotte_bronte.write("Villette", "1853")
    professor = @charlotte_bronte.write("The Professor", "1857")

    assert_equal jane_eyre, @charlotte_bronte.earliest_book
  end

  def test_it_can_return_latest_book
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    professor = @charlotte_bronte.write("The Professor", "1857")
    villette = @charlotte_bronte.write("Villette", "1853")

    assert_equal professor, @charlotte_bronte.latest_book
  end
end
