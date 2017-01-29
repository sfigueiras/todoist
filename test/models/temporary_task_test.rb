require 'test_helper'

class TemporaryTaskTest < ActiveSupport::TestCase
  test "can be created with empty dates" do  
    task = TemporaryTask.new

    assert task.save
  end

  test "start date must be greater that end date" do 
    task = TemporaryTask.new start_date: Date.tomorrow, end_date: Date.current

    refute task.valid?
  end

  test "task can be reschedule after expiring" do
  	task = TemporaryTask.new(description: 'A task',
  		start_date: Date.yesterday, end_date: Date.yesterday)

  	task.reschedule!
  	
  	task.description = 'A modified task'
  	assert task.valid?

    task.end_date = 10.days.from_now.to_date
    assert task.valid?
	end

  # test "task is valid update"
end
