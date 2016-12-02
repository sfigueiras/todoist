class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :list, foreign_key: true
      t.text :description
      t.boolean :state
      t.integer :priority
      t.float :progress
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
