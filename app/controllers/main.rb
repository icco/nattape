NatTape.controller do
  layout :main

  get :index do
    render :index
  end

  get :logout do
    session[:user] = nil
    redirect '/'
  end
end
