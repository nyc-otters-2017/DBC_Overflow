class User < ActiveRecord::Base
  validates :username, :email, :password, presence:  true
  validates :password, length: {minimum:  6}
  has_secure_password


  has_many :questions, :answers, :comments

end
