class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|

      t.string      :w_name,  null: false, default: ""
      t.text        :content, null: false, default: ""
      t.integer     :w_percent, null: false, default: ""
      t.string      :w_url,   null: false, default: ""
      t.string      :email,   null: false, default: ""

      t.timestamps
    end
  end
end
