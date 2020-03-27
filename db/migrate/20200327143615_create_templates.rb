class CreateTemplates < ActiveRecord::Migration[6.0]
  def up
    create_table :templates do |t|
      t.string    :te_name, null: false, default: ""
      t.text      :te_work_names, null: false, default: ""
      # t.string    :te_image_url, null: false, default: ""
      t.timestamps
    end
    add_column :works, :template_id, :integer, null: false, default: 1
  end
  def down
    drop_table :templates
    remove_column :works, :template_id
  end
end
