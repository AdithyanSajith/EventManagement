class Venue < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :reviews, as: :reviewable, dependent: :destroy
end
