class Song < ActiveRecord::Base
  belongs_to :playlist
  mount_uploader :file, SongUploader
  after_initialize :defaults

  def defaults
    self.title ||= "No Title"
    self.artist ||= "Unknown Artist"
    self.length ||= 0
  end
end
