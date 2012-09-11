class AddPhotoColumnsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :photo_file_name, :string, null: false, after: :body
    add_column :posts, :photo_content_type, :string, null: false, after: :photo_file_name
    add_column :posts, :photo_file_size, :integer, null: false, after: :photo_content_type
    add_column :posts, :photo_updated_at, :datetime, null: false, after: :photo_file_size
  end
end
