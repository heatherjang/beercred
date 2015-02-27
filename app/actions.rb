# beercred actions

# helpers do
#   # Returns the logged in user
#   # Re`turns nil if the user is not logged in
#   def current_user
#     if session[:user_id]
#       User.find(session[:user_id])
#     end
#   end
# end

get '/' do
  erb :index
end
get '/user' do
  erb :'/user/index'
end

get '/admin' do
  erb :'/admin/index'
end

get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find params[:id]
  @users = User.all
  erb :'users/show'
end

post '/' do
  user = User.find_by(email: params[:email])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect "/"
  else
    erb :'users/new'
  end
end

post '/users/new' do 
  @user = User.new(
    email: params[:email],
    password: params[:password],
    username: params[:username]
  )
  if @user.save
    redirect '/users'
  else
    erb :'users/new'
  end
end

delete '/user' do
  session[:user_id] = nil
  redirect "/"
end

get '/beer' do
  # do something
  erb :'/test_stripe'
end

post '/beer' do
  # do something
  erb :'/test_stripe'
end

