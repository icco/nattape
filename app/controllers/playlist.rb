NatTape.controllers :playlist do
  layout :main

  get :new do
    render 'playlists/new'
  end

  post :new do
    @playlist = Playlist.new
    @playlist.name = params['name']
    @playlist.description = params['description']
    @playlist.url = "blank"
    # TODO(icco): username saving.
    @playlist.save

    redirect "/playlist/view/#{@playlist.url}"
  end

  get :view, :with => :id do
    @playlist = Playlist.where(:url => params[:id]).first
    render 'playlists/view'
  end

  get :edit, :with => :id do
    render 'playlists/edit'
  end

  post :edit, :with => :id do

  end
end
