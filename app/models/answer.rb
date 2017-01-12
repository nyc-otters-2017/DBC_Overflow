class Answer < ActiveRecord::Base
  # Remember to create a migration!
  validates :body_answer, :total_votes, :password, presence:  true

  belongs_to :user
  belongs_to :question

end
