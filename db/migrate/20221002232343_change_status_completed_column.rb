class ChangeStatusCompletedColumn < ActiveRecord::Migration[7.0]
  def change
    change_column_default :tasks, :status_completed, false
  end
end
