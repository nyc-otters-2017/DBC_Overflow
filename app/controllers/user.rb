get '/user/new' do
  erb :'user/new' #show new user view
end

post '/user' do
  @user = User.new(params[:user])
  if @user.save #saves new user or returns false if unsuccessful
    redirect '/user' #redirect back to user index page
  else
    erb :'user/new' # show new user view again(potentially displaying errors)
  end
end

get '/user/login' do
  erb :'user/login'
end

post '/user/login' do
  p @user = User.find_by(username: params[:user][:username])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'user/login'
  end
end

get '/user/logout' do
  session.clear
  redirect '/'
end

get '/user/:id' do
  @user = User.find(params[:id]) #define instance variable for view
  erb :'user/show' #show single user view
end
