class CreateTask < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      # t.column :to_do_id, :integer
      t.integer :to_do_id
      t.string :name

      t.timestamps
    end
  end
end
