class Vote < ActiveRecord::Base
  validates :up_or_down, presence:  true
  belongs_to :voteable, polymorphic: true
  belongs_to :user 
end
