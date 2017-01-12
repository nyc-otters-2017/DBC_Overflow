class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :username, :email, :password, presence:  true
  validates :password, length: {minimum:  6}
  has_secure_password

end
