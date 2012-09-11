class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, null: false
      t.string :body, null: false
      t.timestamps
    end
  end
end
