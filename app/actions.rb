# Homepage (Root path)
get '/' do
  erb :index
end



get '/users' do
  @users = User.all
  erb :'users/index'
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
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
