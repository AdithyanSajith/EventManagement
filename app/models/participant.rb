class Participant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :registrations, dependent: :destroy
  has_many :events, through: :registrations
  has_many :payments, through: :registrations
  has_many :tickets, through: :registrations
  has_many :reviews, dependent: :destroy
end
