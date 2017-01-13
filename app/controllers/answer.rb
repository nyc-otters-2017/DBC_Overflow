get '/answers/:answer_id/comments/new' do
  @question_answer = Answer.find(params[:answer_id])

  erb :'comments/new'

end

post '/answers/:answer_id/comments' do
  @question_answer = Answer.find(params[:answer_id])
  @comment = @question_answer.comments.new(params[:comment])
  if @comment.save
    redirect "/questions/#{@question_answer.question.id}"
  else
    erb :'comments/new'
  end

end
