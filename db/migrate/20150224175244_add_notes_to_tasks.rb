class AddNotesToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :task_notes, :text
  end
end
