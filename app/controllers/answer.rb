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

post '/answers/:answer_id/upvote' do
  @answer = Answer.find(params[:answer_id])
  @answer.votes.create(up_or_down: 1)
    redirect "/questions/#{@answer.question.id}"
end

post '/answers/:answer_id/downvote' do
  @answer = Answer.find(params[:answer_id])
  @answer.votes.create(up_or_down: -1)
    redirect "/questions/#{@answer.question.id}"
end
