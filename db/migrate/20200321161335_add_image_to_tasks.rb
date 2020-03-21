class AddImageToTasks < ActiveRecord::Migration[6.0]
  def self.up
    add_column :tasks, :image_url, :string, null: false, default: ""
    add_column :tasks, :details, :text, null: false, default: ""
    add_column :tasks, :reference_url, :string, null: false, default: ""
    add_column :tasks, :reference_image, :string, null: false, default: ""
    add_column :tasks, :reference_text, :text, null: false, default: ""
  end
  def self.down
    remove_column :tasks, :image_url
    remove_column :tasks, :details
    remove_column :tasks, :reference_url
    remove_column :tasks, :reference_image
    remove_column :tasks, :reference_text
  end
end