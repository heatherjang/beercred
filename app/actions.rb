# beercred

helpers do
  # Returns the logged in user
  # Returns nil if the user is not logged in
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

end

get '/' do
  erb :index
end

get '/users/new' do
  erb :'users/new'
end

get '/user_session/new' do
  erb :'user_session/new'
end

get 'users/:id'
  @user = User.find params[:id]
  @users = User.all
  erb :'users/show'
end

post '/user_session' do
  user = User.find_by(email: params[:email])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect "/"
  else
    erb :'user_session/new'
  end
end

post '/users' do 
  @user = User.new(
    email: params[:email],
    password: params[:password],
  )
  if @user.save
    redirect '/tracks'
  else
    erb :index
  end
end

delete '/user_session' do
  session[:user_id] = nil
  redirect "/"
end


