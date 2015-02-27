# beercred actions

helpers do
#   # Returns the logged in user
#   # Re`turns nil if the user is not logged in
#   def current_user
#     if session[:user_id]
#       User.find(session[:user_id])
#     end
#   end

  def logged_in?
    session[:user_id]
  end
end

get '/' do
  erb :index
end

get '/user/:id' do
## MUST create login form before uncommenting
  if logged_in?
    # @user = User.find session[:user_id]
    erb :'/user/index'
  else
    redirect '/'
  end
end

get '/admin' do
  erb :'/admin/index'
end

get '/user/new' do
  redirect '/'
end

post '/' do
  user = User.find_by(email: params[:email])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect '/user/:id'
  else
    redirect '/'
  end
end

post '/user' do 
  @user = User.new(
    email: params[:email],
    password: params[:password],
    username: params[:username]
  )
  if @user.save
    session[:user_id] = user.id
    redirect '/user/:id'
  else
    redirect '/'
  end
end


# USING FOR TESTING, DELETE ONCE IMPLEMENTS ON MAIN PAGES
get '/beer' do
  # do something
  erb :'/test_stripe'
end

post '/beer' do
  # do something
  erb :'/test_stripe'
end

