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

def smart_answer
  Faker::Hacker.say_something_smart
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

  10.times do
    User.create!(
      username: fake_name,
      email:    fake_email,
      password: 'password'
      )
  end

  30.times do
    User.all.sample.questions.create!(
      title: "#{Faker::ChuckNorris.fact}",
      body_question: "Why is/does #{Faker::ChuckNorris.fact} a true fact?",
      total_votes: 0
      )
  end

  30.times do
    Question.all.sample.answers.create!(
      body_answer: Faker::Hacker.say_something_smart, total_votes: 0
      )
    end

  10.times do
    Question.all.sample.comments.create!(
    body_comment: "Jeremy was here; for question"
    )
  end

  10.times do
    Answer.all.sample.comments.create!(
    body_comment: "Jeremy was here; for answer"
    )
  end

  30.times do
    Question.all.sample.votes.create!(
      :up_or_down      => fake_vote
    )
  end

  30.times do
    Answer.all.sample.votes.create!(
      :up_or_down      => fake_vote
    )
  end
