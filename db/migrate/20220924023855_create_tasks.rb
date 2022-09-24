class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :task
      t.date :date
      t.time :time
      t.boolean :status_completed
      t.integer :category_id, index: true
      t.timestamps
    end
  end
end
