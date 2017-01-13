get '/questions' do

  @questions = Question.all
  @questions.each do |question|
    question.get_total_votes
  end

  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end


get '/questions/:id' do
  @question = Question.find(params[:id])
  @question.answers.each do |answer|
    answer.get_total_votes
  end
  
  erb :'questions/show'
end
