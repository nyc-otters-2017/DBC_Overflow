class Vote < ActiveRecord::Base
  belongs_to :voteable
  
  # Remember to create a migration!
end
