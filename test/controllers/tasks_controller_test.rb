require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @task = tasks(:two)
  end
  test "should get index" do
    get category_tasks_path(category_id:@task.category_id)
    assert_response :success
  end

  test "should get show" do
    get category_task_path(category_id:@task.category_id, id:@task.id)
    assert_response :success
  end

  test "should get new" do
    get new_category_task_path(category_id:@task.category_id)
    assert_response :success
  end

  test "should post new task" do
    assert_difference 'Task.count', 1 do
      post category_tasks_path(category_id:@task.category_id),
      params: { task: { body: 'kain na kuya', date: '2021-03-17', category_id: @task.category_id } }
    end
    assert_redirected_to category_tasks_path
  end

  test "should get edit" do
    get edit_category_task_path(category_id:@task.category_id, id:@task.id)
    assert_response :success
  end

  test "should post updated task" do
    put category_task_path(category_id:@task.category_id, id:@task.id),
      params: { task: { body: 'testing', date: '2021-02-20'} }
    update = Task.find(@task.id)
    assert update.body == 'testing'
  end

  test "should get delete" do
    assert_difference 'Task.count', -1 do
      delete category_task_path(category_id:@task.category_id, id:@task.id)
    end
    assert_redirected_to category_tasks_path
  end
end
