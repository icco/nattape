class Playlist < ActiveRecord::Base
  has_many :songs

  # Copied from https://github.com/icco/abelinkin/blob/master/site.rb
  def url= x
    @@hash_chars = ("1".."z").reject {|val| (/\w+/ =~ val).nil? }
    r = Random.new

    begin
      idx = []
      h = ""
      (0..5).each { idx.push r.rand(0..@@hash_chars.length) }
      idx.each {|i| h << @@hash_chars[i] }
    end while !h and !Playlist.find(:url => h).nil?

    super h
  end

  def count
    return self.songs.count
  end

  def play_length
    return 100
  end
end
