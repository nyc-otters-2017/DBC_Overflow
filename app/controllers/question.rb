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

post '/questions' do
    @user = current_user
    @question = Question.new(params[:question]) #create new question
    @question.user = @user
    if @question.save
      redirect '/questions'
    else
      erb :'questions/new' # show new questions view again(potentially displaying errors)
    end
  end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @question.answers.each do |answer|
    answer.get_total_votes
  end

  erb :'questions/show'
end

get '/questions/:question_id/answers/new' do

  @question = Question.find(params[:question_id])

  erb :'answers/new'

end

post "/questions/:id/answers" do
  @question = Question.find(params[:id])
  @answer = Answer.new(body_answer: params[:body_answer])
  @answer.user = current_user
  @answer.question = @question

  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @answer.errors.full_messages
    erb :'answers/new'
  end

end
