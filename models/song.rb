class Song < ActiveRecord::Base
  belongs_to :playlist
  has_attached_file :file

  # https://github.com/thoughtbot/paperclip/wiki/Extracting-mp3-metadata
end
