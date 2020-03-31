class CreateKnowhows < ActiveRecord::Migration[6.0]
  def up
    create_table :knowhows do |t|

      t.string    :k_name, null: false, default: ""
      t.integer   :template_id, null: false, default: 1
      t.text      :k_description, null: false, default: ""
      t.string    :reference_url, null: false, default: ""
      t.text      :reference_title, null: false, default: ""
      t.string    :k_tasks_json_url, null: false, default: ""

      t.date      :start_date
      t.integer   :date_duration, null: false, default: 0
      t.integer   :is_date_fixed, null: false, default: 0
      t.integer   :download_count, null: false, default: 0
      t.timestamps
    end
  end

  def down
    drop_table :knowhows
  end

end
