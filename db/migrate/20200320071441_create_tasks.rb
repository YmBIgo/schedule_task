class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|

      t.string    :t_name,         null: false, default: ""
      t.date      :start_date,     null: false, default: ""
      t.date      :end_date,       null: false, default: ""
      t.string    :role,           null: false, default: ""
      t.integer   :parent_task_id, null: false, default: ""
      t.integer   :following_task_id,   null: false, default: ""
      t.integer   :t_number,       null: false, default: ""
      t.integer   :work_id,        null: false, default: ""
      t.integer   :person_id,      null: false, default: ""

      t.integer   :before_date,    null: false, default: 1
      t.integer   :date_duration,  null: false, default: 1

      t.timestamps
    end
  end
end
