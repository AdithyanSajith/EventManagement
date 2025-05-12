class Genre < ApplicationRecord
  has_many :events, dependent: :destroy

  enum genre_type: {
    music: 0,
    conference: 1,
    workshop: 2,
    seminar: 3,
    sports: 4
  }

end
