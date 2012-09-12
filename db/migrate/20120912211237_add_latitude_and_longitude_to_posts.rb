class AddLatitudeAndLongitudeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :latitude, :decimal, precision: 15, scale: 12, after: :photo_file_size
    add_column :posts, :longitude, :decimal, precision: 15, scale: 12, after: :latitude
  end
end
