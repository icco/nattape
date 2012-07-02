class Song < ActiveRecord::Base
  belongs_to :playlist
  mount_uploader :file, SongUploader
  after_initialize :defaults
  before_save :update_asset_attributes

  private

  def update_asset_attributes
    if file.present? && file_changed?
      logger.push("Parsing: #{file.file.path.inspect}", :devel)

      case file.file.path
      when /\.mp3$/
        open_opts = { :encoding => 'utf-8' }
        Mp3Info.open(file.file.path, open_opts) do |mp3|
          self.title = mp3.tag.title
          self.artist = mp3.tag.artist
        end
      when /\.m4a$/
        # TODO(icco): This doesn't work...
        MP4Info.open(file.file.path) do |mp3|
          p mp3
          p mp3.tag
          self.title = mp3.tag.title
          self.artist = mp3.tag.artist
        end
      end
    end
  end

  def defaults
    self.title ||= "No Title"
    self.artist ||= "Unknown Artist"
    self.length ||= 0
  end
end
