NatTape.controller do
  layout :main

  get :index do
    if session[:user]
      @playlists = Playlist.where(:username => session[:user]).order("created_at DESC")
    end

    render :index
  end

  get :logout do
    session[:user] = nil
    redirect '/'
  end
end
