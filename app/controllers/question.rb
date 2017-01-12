get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/question/new' do
  erb :'question/new'
end


get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end
