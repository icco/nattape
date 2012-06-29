class Song < ActiveRecord::Base
  belongs_to :playlist
  has_attached_file :file

  # https://github.com/thoughtbot/paperclip/wiki/Extracting-mp3-metadata
  before_save :extract_metadata
  serialize :metadata

  # Helper method to determine whether or not an attachment is an mp3 file.
  # @note Use only if you have a generic asset-type model that can handle different file types.
  def audio?
    upload_content_type =~ %r{^audio/(?:mp3|m4a|mpeg|mpeg3|mpg|x-mp3|x-mpeg|x-mpeg3|x-mpegaudio|x-mpg)$}
  end

  # MP3-aware display name, consisting of track title and artist
  # Force encoding required to deal with mixed content bugs on Ruby 1.9
  # @return 'Title - Artist' if audio file
  # @return 'file.ext' if not audio file
  def display_name
    @display_name ||= if audio? && metadata?
      artist, title = metadata.values_at('artist', 'title')
      title.present? ? [title, artist].compact.join(' - ').force_encoding('UTF-8') : upload_file_name
    else
      upload_file_name
    end
  end

  private

  # Retrieves metadata for MP3s
  def extract_dimensions
    return unless audio?
    path = upload.queued_for_write[:original].path
    open_opts = { :encoding => 'utf-8' }
    Mp3Info.open(path, open_opts) do |mp3info|
      p mp3info
      self.metadata = mp3info.tag
    end
  end
end
