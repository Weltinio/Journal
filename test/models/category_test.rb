require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "1. does not save if title is missing" do
    category = Category.new
    category.rating = 10
    category.description = 'eating is fun and good'
    assert_not category.save, 'saved without title'
  end

  test "2. does not save if rating is missing" do
    category = Category.new
    category.title = 'Food'
    category.description = 'eating is fun and good'
    assert_not category.save, 'saved without title'
  end

  test "3. does not save if description is too short" do
    category = Category.new
    category.title = 'Food'
    category.rating = 10
    category.description = 'eat'
    assert_not category.save, 'saved without title'
  end
end
