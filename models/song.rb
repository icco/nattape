class Song < ActiveRecord::Base
  belongs_to :playlist
  mount_uploader :file, SongUploader
end
