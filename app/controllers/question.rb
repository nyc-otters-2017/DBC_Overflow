get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/question/new' do
  erb :'question/new'
end
