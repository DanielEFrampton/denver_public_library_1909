require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'

class BookTest < Minitest::Test
  def setup
    @book = Book.new({
                      author_first_name: "Harper",
                      author_last_name: "Lee",
                      title: "To Kill a Mockingbird",
                      publication_date: "July 11, 1960"
                    })
  end

  def test_it_exists
    assert_instance_of Book, @book
  end

  def test_it_initializes_with_readable_attributes
    assert_equal "To Kill a Mockingbird", @book.title
    assert_equal 0, @book.checkouts
  end

  def test_it_can_return_author_full_name
    assert_equal "Harper Lee", @book.author
  end

  def test_it_can_return_publication_year
    assert_equal "1960", @book.publication_year
  end

  def test_it_can_add_checkout_to_total
    @book.add_checkout

    assert_equal 1, @book.checkouts

    @book.add_checkout

    assert_equal 2, @book.checkouts
  end

  def test_checking_out_changes_checkedout_status_to_true
    assert_equal false, @book.checked_out
    @book.checkout
    assert_equal true, @book.checked_out
    @book.checkout
    assert_equal true, @book.checked_out
  end

  def test_being_checked_out_increments_checkouts_and_returns_true
    assert_equal 0, @book.checkouts
    assert_equal true, @book.checkout
    assert_equal 1, @book.checkouts
    assert_equal true, @book.checkout
    assert_equal 2, @book.checkouts
    assert_equal true, @book.checkout
  end

  def test_its_checked_out_status_changes_to_false_when_returned
    assert_equal false, @book.checked_out
    @book.checkout
    assert_equal true, @book.checked_out
    @book.return
    assert_equal false, @book.checked_out
  end
end
