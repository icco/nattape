NatTape.controllers :playlist do
  layout :main

  get :new do
    render :new
  end

  post :new do

  end

  get :view, :with => :id do
    @playlist = Playlist.where(:url => id)
    render :view
  end

  get :edit, :with => :id do
    render :view
  end

  post :edit, :with => :id do

  end
end
