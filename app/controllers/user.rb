# #create # should only be necessary with a separate register page
# get '/users/new' do
#   erb :'users/new'
# end

post '/users' do
  @user = User.new(params[:user])
    if @user.save!
      @user = User.last
      session[:user_id] = @user.id
      erb :'/users/:id'
    else
      redirect '/'
    end
end

#read
get '/users/:id' do
  if logged_in?
    erb :'users/show'
  else
    redirect '/'
  end
end

#update
post '/users/:id' do
    User.update(params[:user])
end

post '/logout' do
  session.clear
  redirect '/'
end

#delete

post '/users/:id/delete' do
  user_to_delete = User.find(params[:id])
  user_to_delete.destroy
  redirect '/'
end


