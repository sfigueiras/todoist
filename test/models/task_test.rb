require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "tasks are correctly sorted" do 
    task_one = Task.create priority: 1
    task_two = Task.create priority: 2

    assert_equal Task.all.order(:priority).first, task_one
  end
end
