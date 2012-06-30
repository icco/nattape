class Playlist < ActiveRecord::Base
  has_many :songs

  after_initialize :defaults

  def defaults
    self.url ||= Playlist.gen_url
    self.name ||= "Blank"
  end

  def user
    protocol, user = self.username.split(':')
    return user
  end

  # Copied from https://github.com/icco/abelinkin/blob/master/site.rb
  def self.gen_url
    @@hash_chars = ("1".."z").reject {|val| (/\w+/ =~ val).nil? }
    r = Random.new

    begin
      idx = []
      h = ""
      (0..5).each { idx.push r.rand(0..@@hash_chars.length) }
      idx.each {|i| h << @@hash_chars[i] }
    end while !h and !Playlist.find(:url => h).nil?

    return h
  end

  def count
    return self.songs.count
  end

  def play_length
    return 100
  end
end
