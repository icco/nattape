class SongUploader < CarrierWave::Uploader::Base 
  storage :file 
  def store_dir 
    "songs" 
  end 
end
