#login

get '/' do
  erb :index
end

post '/login' do
  @user = User.find_by email: params[:email]
  if @user
    if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        @user.id.to_s
    else
      return "error"
    end
  else
    return "error"
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
