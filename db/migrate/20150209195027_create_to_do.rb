class CreateToDo < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
