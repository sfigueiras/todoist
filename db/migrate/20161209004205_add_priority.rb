class AddPriority < ActiveRecord::Migration[5.0]
  def change
  	Task.all.each do |t|
  		say "Adding priority to task #{t.id}"
  		t.priority = rand(3)+1
  		t.save!
  	end
  end
end
