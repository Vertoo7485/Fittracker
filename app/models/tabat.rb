class Tabat < ApplicationRecord
  belongs_to :user

  validates :mahi_dumbbells_through_the_sides, presence: true
  validates :incline_dumbbell_mahi, presence: true
  validates :trusters, presence: true
  validates :kettlebell_swing, presence: true
  validates :barbell_forearm_curl, presence: true

end
