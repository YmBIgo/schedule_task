class CreateChecklists < ActiveRecord::Migration[6.0]
  def up
    create_table :checklists do |t|

      t.integer   :task_id, null: false, default: 1
      t.string    :c_name, null: false, default: ""
      t.boolean   :checked, null: false, default: false

      t.timestamps
    end

    add_column :roles, :line_id, :string, null: false, default: ""
    add_column :roles, :is_line_friend, :boolean, null: false, default: false
    add_column :roles, :line_push_period, :integer, null: false, default: 7
    add_column :tasks, :is_line_pushed, :boolean, null: false, default: false
    add_column :tasks, :line_push_before, :integer, null: false, default: false
    add_column :tasks, :line_push_date, :date
    # add_column :tasks, :is_date_fix, :integer, null: false, default: 1
    add_column :tasks, :t_percent, :integer, null: false, default: 0
    # add_column :tasks, :default_date_fix_date, :date

  end

  def down

    drop_table :checklists

    remove_column :roles, :line_id
    remove_column :roles, :is_line_friend
    remove_column :roles, :line_push_period
    remove_column :tasks, :is_line_pushed
    remove_column :tasks, :line_push_before
    remove_column :tasks, :line_push_date
    # remove_column :tasks, :is_date_fix
    remove_column :tasks, :t_percent
    # remove_column :tasks, :default_date_fix_date

  end
end
