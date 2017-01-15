get '/' do
  @questions = Question.all.reverse
  erb :'questions/index'
end
