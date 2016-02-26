class AddSubCatToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :skill, :string
  end
end
