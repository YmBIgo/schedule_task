# frozen_string_literal: true

class DeviseCreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.integer :work_id,           null: false, default: 1
      t.string :workurl,            null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.inet     :current_sign_in_ip
      # t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    # add_index :roles, :email,                unique: true
    add_index :roles, :reset_password_token, unique: true
    add_index :roles, :workurl,       unique: true
    add_index :roles, :work_id,              unique: true
    # add_index :roles, :confirmation_token,   unique: true
    # add_index :roles, :unlock_token,         unique: true

    add_column :tasks, :reference_title, :string, null: false, default: ""
    add_column :tasks, :role_id, :integer, null: false, default: 0

  end
end
