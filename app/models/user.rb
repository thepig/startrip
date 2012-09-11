class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :token_authenticatable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :username


  has_many :posts


  validates :username, presence: true, uniqueness: true
end
