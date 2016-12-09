class ChangeProgressToInt < ActiveRecord::Migration[5.0]
  def change
  	change_column :tasks, :progress,  :integer
  end
end
