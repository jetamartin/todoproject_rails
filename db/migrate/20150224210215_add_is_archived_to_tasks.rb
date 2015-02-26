class AddIsArchivedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :is_archived_task, :boolean
  end
end
