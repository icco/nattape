class AddAttachmentToSongs < ActiveRecord::Migration
  def change
    add_column :songs, "file_file_name", :string
    add_column :songs, "file_content_type", :string
    add_column :songs, "file_file_size", :string
    add_column :songs, "file_updated_at", :string
  end
end
