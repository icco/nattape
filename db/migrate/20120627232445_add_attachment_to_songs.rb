class AddAttachmentToSongs < ActiveRecord::Migration
  def change
    add_attachment :songs, :file
  end
end
