class AddDoneToTasks < ActiveRecord::Migration[6.0]
  def self.up
    add_column :tasks, :priority, :integer, null: false, default: 0
    add_column :tasks, :done,     :boolean, null: false, default: false
    add_column :tasks, :type_id,     :integer, null: false, default: 1
  end
  def self.down
    remove_column :tasks, :priority, :integer
    remove_column :tasks, :done,     :boolean
    remove_column :tasks, :type_id,     :integer
  end
end
