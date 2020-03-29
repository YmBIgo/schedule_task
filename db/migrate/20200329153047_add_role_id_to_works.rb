class AddRoleIdToWorks < ActiveRecord::Migration[6.0]
  def up
    add_column :roles, :work_limit, :integer, null: false, default: 10
    add_column :works, :role_id,    :integer, null: false, default: 1
    add_column :templates, :download_count, :integer, null: false, default: 0
    add_column :templates, :is_date_fixed,  :integer, null: false, default: 0
    remove_column :tasks, :role_id
  end
  def down
    remove_column :roles, :work_limit
    remove_column :works, :role_id
    remove_column :templates, :download_count
    remove_column :templates, :is_date_fixed
    add_column :tasks, :role_id, :integer, default: 0
  end
end
