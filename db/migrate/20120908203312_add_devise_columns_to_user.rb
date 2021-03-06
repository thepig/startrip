class AddDeviseColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :authentication_token, :string, null: false, after: :encrypted_password

    add_index :users, :authentication_token, unique: true
  end
end
