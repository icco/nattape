class Songs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string  :title
      t.string  :artist
      t.string  :description
      t.integer :playlist_id
      t.integer :length # In seconds

      t.timestamps
    end
  end
end
