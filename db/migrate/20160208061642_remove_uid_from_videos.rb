class RemoveUidFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :uid, :string
  end
end
