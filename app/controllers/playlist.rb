NatTape.controllers :playlist do
  layout :main

  get :new do
    logged_in?

    render 'playlists/new'
  end

  post :new do
    logged_in?

    @playlist = Playlist.new
    @playlist.name = params['name'] if params['name']
    @playlist.description = params['description'] if params['description']
    @playlist.username = session[:user]
    @playlist.save

    redirect url(:playlist, :view, @playlist.url)
  end

  get :view, :with => :id do
    @playlist = Playlist.where(:url => params[:id]).first
    render 'playlists/view'
  end

  get "/view/:id/update" do
    @playlist = Playlist.where(:url => params[:id]).first
    @playlist.songs.each {|s| s.update_asset_attributes true; s.save }
    render 'playlists/view'
  end

  get :edit, :with => :id do
    @playlist = Playlist.where(:url => params[:id]).first
    render 'playlists/edit'
  end

  post :edit, :with => :id do
    @playlist = Playlist.where(:url => params[:id]).first

    song = Song.new
    song.file = params["file"]
    song.playlist = @playlist
    song.save

    redirect url(:playlist, :view, @playlist.url)
  end
end
