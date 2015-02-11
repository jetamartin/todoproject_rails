class ChangeTaskColumnName < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.rename :task, :name
    end
  end
end
