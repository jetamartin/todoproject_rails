class AddIsArchivedToToDos < ActiveRecord::Migration
  def change
    add_column :to_dos, :is_archived_list, :boolean
  end
end
