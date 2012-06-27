NatTape.controllers :auth do

  # For development testing
  post '/developer/callback' do
    auth = request.env['omniauth.auth']
    auth = auth.info
    logger.push(" Developer: #{auth.inspect}", :devel)

    session[:user] = auth["name"]

    redirect '/'
  end

  get '/twitter/callback' do
    redirect '/'
  end

  get '/failure' do
    flash[:notice] = params[:message]
    redirect '/'
  end
end
