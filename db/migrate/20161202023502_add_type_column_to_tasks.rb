class AddTypeColumnToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :type, :string
  end
end
