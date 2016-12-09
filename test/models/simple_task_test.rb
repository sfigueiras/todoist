require 'test_helper'

class SimpleTaskTest < ActiveSupport::TestCase
  test "task can be created without a data" do 
    task = SimpleTask.new 

    assert task.save
  end
end
