class Comment < ActiveRecord::Base
  # Remember to create a migration!
  validates :body_comment, presence:  true
  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
