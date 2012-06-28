NatTape.controllers :playlist do
  layout :main

  get :new do
    render 'playlists/new'
  end

  post :new do

  end

  get :view, :with => :id do
    @playlist = Playlist.where(:url => id)
    render 'playlists/view'
  end

  get :edit, :with => :id do
    render 'playlists/edit'
  end

  post :edit, :with => :id do

  end
end
