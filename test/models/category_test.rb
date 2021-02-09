require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "1. Should create with title" do
    category = Category.new
    category.rating = 10
    category.description = 'eating is fun and good'
    assert_not category.save, 'saved without title'
  end

  test "2. Should create with rating" do
    category = Category.new
    category.title = 'Food'
    category.description = 'eating is fun and good'
    assert_not category.save, 'saved without rating'
  end

  test "3. Should consider validations" do
    category = Category.new
    category.title = 'Food'
    category.rating = 10
    category.description = 'eat'
    assert_not category.save, 'saved without validations'
  end
end
