class SchemaInit < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :url
      t.string :username

      t.timestamps
    end
  end
end
