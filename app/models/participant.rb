class Participant < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_many :events, through: :registrations
  has_many :payments, through: :registrations
  has_many :tickets, through: :registrations
  has_many :reviews, dependent: :destroy
end
