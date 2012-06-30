class Song < ActiveRecord::Base
  belongs_to :playlist
  mount_uploader :file, SongUploader
  after_initialize :defaults
  before_save :update_asset_attributes
    
  private

  # TODO(icco): this.
  def update_asset_attributes
    #  if asset.present? && asset_changed?
    #    self.content_type = asset.file.content_type
    #    self.file_size = asset.file.size
    #  end
  end

  def defaults
    self.title ||= "No Title"
    self.artist ||= "Unknown Artist"
    self.length ||= 0
  end
end
