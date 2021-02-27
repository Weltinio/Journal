require "test_helper"

class TaskTest < ActiveSupport::TestCase
  
  test 'should not save task without body' do
    task = Task.new
    task.date = '2021-02-20'
    assert_not task.save, 'saved without body'
  end
  test 'should not save task without date' do
    task = Task.new
    task.body = '2021-02-20'
    assert_not task.save, 'saved without date'
  end
  test 'should not save task with short body' do
    task = Task.new
    task.body = 'do' 
    assert_not task.save, 'saved with short body'
  end
  test 'should not save task with short title' do
    task = Task.new
    task.title = 'ye' 
    assert_not task.save, 'saved with short title'
  end
end
