NatTape.controllers :auth do
  layout :main

  get :index do
    render "auth/index"
  end

  # For development testing
  post '/developer/callback' do
    auth = request.env['omniauth.auth']
    auth = auth.info
    logger.push(" Developer: #{auth.inspect}", :devel)

    session[:user] = "developer:#{auth["name"]}"

    redirect '/playlist/new'
  end

  get '/twitter/callback' do
    auth = request.env['omniauth.auth']
    auth = auth.info
    logger.push(" Twitter: #{auth.inspect}", :devel)

    session[:user] = "twitter:#{auth['nickname']}"

    redirect '/playlist/new'
  end

  get '/failure' do
    flash[:notice] = params[:message]
    redirect '/'
  end
end
