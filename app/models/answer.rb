class Answer < ActiveRecord::Base
  validates :body_answer, presence:  true

  belongs_to :user
  belongs_to :question

  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  def get_total_votes
    self.votes.sum(:up_or_down)
  end

end
