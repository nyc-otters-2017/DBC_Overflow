get '/answers/new' do
  erb :'answers/new'
end

post '/answers' do

  #below works with properly formatted params in HTML form
  @answer = Answer.new(params[:answer]) #create new answer

  if @answer.save #saves new answer or returns false if unsuccessful
    redirect '/answers' #redirect back to answers index page
  else
    erb :'answers/new' # show new answers view again(potentially displaying errors)
  end

end


get '/answers/:id/edit' do

  #get params from url
  @answer = Answer.find(params[:id]) #define intstance variable for view

  erb :'answers/edit' #show edit answer view

end


put '/answers/:id' do

  #get params from url
  @answer = Answer.find(params[:id]) #define variable to edit

  @answer.assign_attributes(params[:answer]) #assign new attributes

  if @answer.save #saves new answer or returns false if unsuccessful
    redirect '/answers' #redirect back to answers index page
  else
    erb :'answers/edit' #show edit answer view again(potentially displaying errors)
  end

end


delete '/answers/:id' do

  #get params from url
  @answer = Answer.find(params[:id]) #define answer to delete

  @answer.destroy #delete answer

  redirect '/answers' #redirect back to answers index page

end
