class Event < ApplicationRecord
  belongs_to :host
  belongs_to :venue
  belongs_to :genre

  has_many :registrations, dependent: :destroy
  has_many :participants, through: :registrations
  has_many :reviews, as: :reviewable, dependent: :destroy
end
