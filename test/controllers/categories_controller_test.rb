require "test_helper"
require "pp"
class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "1. Should get categories index" do
    get categories_path
    assert_response :success
  end

  test "2. Should get categories show" do
    activity = Category.create(title: 'Eats', description: 'Eat a bunch of foods', rating: 1)
    get show_category_path(title: activity.title)
    assert_response :success
  end

  test "3. Should get categories edit" do
    activity = Category.create(title: 'Eats', description: 'Eat a bunch of foods', rating: 1)
    get edit_category_path(title: activity.title)
    assert_response :success
  end

  test "4. Should post edited category" do
    activity = Category.create(title: 'Eats', description: 'Eat a bunch of foods', rating: 1)
    put update_category_path(title: activity.title), 
      params: { category: { title: "Eats", description: 'dont get hungry bitch', rating: 10} }
  end

  test "5. Should create new category" do
    get new_category_path
    assert_response :success
  end

  test "6. Should post new category" do
    assert_difference 'Category.count', 1 do
      post create_category_path, 
      params: { category: { title: "Eats", description: 'dont get hungry bitch', rating: 10} }
    end
    assert_redirected_to categories_path
  end

  test "7. Should update category" do
    activity = Category.create(title: 'Eats', description: 'Eat a bunch of foods', rating: 1)
    put update_category_path(title: activity.title), 
      params: { category: { title: "Eats", description: 'dont get hungry bitch', rating: 10} }
    update = Category.find_by(title: 'Eats')
    assert update.description == 'dont get hungry bitch'
  end
  
  test "8. Should delete category" do
    activity = Category.create(title: 'Eats', description: 'Eat a bunch of foods', rating: 1)
    assert_difference 'Category.count', -1 do
      delete delete_category_path(activity.title)
    end
    assert_redirected_to categories_path
  end
end