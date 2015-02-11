class AddIsDoneColumn < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.boolean :is_done
   end
#  Or alternatively I could do:  add_column :tasks, :is_done, :boolean
  end
end
