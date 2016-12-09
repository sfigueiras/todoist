require 'test_helper'

class LongTaskTest < ActiveSupport::TestCase
  test "progress must be between 1 and 100" do 
    task = LongTask.new

    task.progress = 200
    refute task.save 
  end
end
