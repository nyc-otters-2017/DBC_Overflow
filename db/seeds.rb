def fake_name
  "#{Faker::Internet.user_name}"
end

def fake_email
  "#{Faker::Internet.free_email}"
end

def fake_password
  "dhrdfhbfdhbfdhb"
end

def fake_vote
  [1,-1].sample
end

# Remove all from the database
User.delete_all
Vote.delete_all
Answer.delete_all
Question.delete_all
Comment.delete_all


  user1 =  User.create!({
    :username      => fake_name,
    :email  => fake_email,
    :password => "dhrdfhbfdhbfdhb"
  })

  30.times do
    Question.create!(user_id: rand((User.all.size + 1)), title: "#{Faker::ChuckNorris.fact}", body_question: Faker::Hacker.say_something_smart, total_votes: rand(20))
  end

  question1 = Question.create!(user_id: user1.id, title: "hello Jeremy", body_question: 'My name is Jeremy, and I am better than Kevin', total_votes:100)
  question2 = Question.create!(user_id: user1.id , title: "I am the king of the world!", body_question: 'My name is Jeremy, and I am better than Kevin', total_votes:9000)

  answer1 = Answer.create!(user_id: user1.id, body_answer: "hello Jeremy this is answer", total_votes: 100, question_id:question1.id)
  Answer.create!(user_id: user1.id, body_answer: "hello Jeremy this is answer2", total_votes: 200, question_id:question2.id)

  Comment.create!(user: user1, body_comment: "hello Jeremy Comment", commentable_id: question1.id, commentable_type:'Question')
  Comment.create!(user: user1, body_comment: "hello Jeremy Comment", commentable_id: answer1.id, commentable_type:'Answer')

  Vote.create!({
    :up_or_down      => fake_vote,
    :voteable_id     => question1.id,
    :voteable_type   =>"Question"
  })

  Vote.create!({
    :up_or_down      => fake_vote,
    :voteable_id     => answer1.id,
    :voteable_type   =>"Answer"
  })
