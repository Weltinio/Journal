require "test_helper"
require "pp"
class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
    @category = categories(:one)
  end
  test "1. Should get categories index" do
    get categories_path
    assert_response :success
  end

  test "3. Should get categories edit" do
    get edit_category_path(id:@category.id)
    assert_response :success
  end

  test "4. Should post edited category" do
    @category.user_id = users(:user_001).id
    @category.save
    put category_path(id: @category.id), 
      params: { category: { title: "Eats", description: 'dont get hungry bitch', rating: 10} }
    update = Category.find(@category.id)
    assert update.description == 'dont get hungry bitch'
  end

  test "5. Should create new category" do
    get new_category_path
    assert_response :success
  end

  test "6. Should post new category" do
    assert_difference 'Category.count', 1 do
      post categories_path, 
      params: { category: { title: "Eats", description: 'dont get hungry bitch', rating: 10} }
    end
    assert_redirected_to categories_path
  end
  
  test "7. Should delete category" do
    assert_difference 'Category.count', -1 do
      delete category_path(@category.id)
    end
    assert_redirected_to categories_path
  end
end