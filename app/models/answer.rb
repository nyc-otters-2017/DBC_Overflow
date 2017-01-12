class Answer < ActiveRecord::Base
  validates :body_answer, :total_votes, presence:  true

  belongs_to :user
  belongs_to :question

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
end
