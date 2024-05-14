class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable,
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :user_passwords, dependent: :destroy
  has_many :passwords, through: :user_passwords
end
