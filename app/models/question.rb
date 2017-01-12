class Question < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, :body_question, :total_votes, presence:  true
  belongs_to :user
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  has_many :answers
end
