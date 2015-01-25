class AddLatitudeAndLongitudeToProject < ActiveRecord::Migration
  def change
    add_column :projects, :latitude, :float
    add_column :projects, :longitude, :float
  end
end
