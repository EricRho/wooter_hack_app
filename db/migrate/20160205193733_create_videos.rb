class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :author
      t.string :link
      t.string :duration

      t.timestamps null: false
    end
  end
end
