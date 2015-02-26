# Homepage (Root path)
get '/' do
  erb :index
end

get '/user' do
  erb :'/user/index'
end

get '/admin' do
  erb :'/admin/index'
end