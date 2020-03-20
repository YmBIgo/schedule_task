class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|

      t.string      :p_name,  null: false, default: ""
      t.string      :role,    null: false, default: ""
      t.integer     :role_id, null: false, default: 0

      t.timestamps
    end
  end
end
