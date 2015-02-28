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
  
  def current_user
    User.find(session[:user_id])
  end

  def top_five_users_on_leaderboard
    User.all.order("beer_count DESC").limit(5)
  end

  def all_users_by_beer_count
    User.all.order("beer_count DESC")
  end

  def current_admin 
    Admin.first
  end

end

get '/' do
  erb :index
end

get '/user/:id' do
## MUST create login form before uncommenting
  @users = User.all
  if logged_in?
    @user = current_user
    erb :'/user/index'
  else
    redirect '/'
  end
end

post '/user/buy_beer' do
  if (params[:num_beers].to_i > 0) && (params[:num_beers].to_i <= current_admin.inventory)
    Transaction.create(user_id: current_user.id, num_purchased: params[:num_beers])
    admin = current_admin
    admin.inventory -= params[:num_beers].to_i
    admin.save
    user = current_user
    user.beer_count += params[:num_beers].to_i
    @current_beers = params[:num_beers].to_i
    user.save
  end
  redirect "user/#{current_user.id}"
end

get '/admin' do
  @users = User.all
  erb :'/admin/index'
end

get '/user/new' do
  redirect '/'
end

post '/' do
  user = User.find_by_email(params[:email])
  if user && (user.password == params[:password])
    session[:user_id] = user.id
    redirect "/user/#{current_user.id}"
  else
    redirect '/'
  end
end

post '/user' do 
  user = User.new(
    email: params[:email],
    password: params[:password],
    username: params[:username],
    admin_id: current_admin.id
  )
  if user.save
    session[:user_id] = user.id
    redirect "/user/#{current_user.id}"
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

# FOR TESTING NAVBAR DESIGNS; DELETE AFTER IMPLEMENTED
get '/navbar_user' do
  erb :navbar_user
end

get '/navbar_index' do
  erb :navbar_index
end
