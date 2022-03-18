class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, presence: true
  validates :password, presence: true
  validates :encrypted_password, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_ruby, presence: true
  validates :first_name_ruby, presence: true

  has_many :avatars
  has_many :comments
end
