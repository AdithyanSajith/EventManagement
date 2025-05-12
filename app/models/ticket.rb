class Ticket < ApplicationRecord
  belongs_to :registration
  has_one :participant, through: :registration
end
