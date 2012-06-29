NatTape.controller do
  layout :main

  get :index do
    @playlists = Playlist.order("created_at DESC")
    render :index
  end

  get :logout do
    session[:user] = nil
    redirect '/'
  end
end
