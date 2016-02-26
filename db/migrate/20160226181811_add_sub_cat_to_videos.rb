class AddSubCatToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :subcategory, :string
  end
end
