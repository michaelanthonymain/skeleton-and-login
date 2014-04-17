#login
get '/' do
  erb :index
end

post '/login' do
  @user = User.where(params[:email]).first
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end
end

#logout
get '/logout' do
  session.clear
  redirect '/'
end
