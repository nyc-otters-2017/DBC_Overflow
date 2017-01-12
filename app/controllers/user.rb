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
