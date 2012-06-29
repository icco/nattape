class Carrierwave < ActiveRecord::Migration
  def change
    add_column :songs, :file, :string
    remove_column :songs, "file_file_name"
    remove_column :songs, "file_content_type"
    remove_column :songs, "file_file_size"
    remove_column :songs, "file_updated_at"
  end
end
