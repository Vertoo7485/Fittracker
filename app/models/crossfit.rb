class Crossfit < ApplicationRecord
  belongs_to :user

  validates :front_squat, presence: true
  validates :hang_grab, presence: true
  validates :overhead_press, presence: true
  validates :kettlebell_swing, presence: true
  validates :kettlebell_pull_to_the_chin, presence: true
  validates :russian_twist, presence: true
  validates :plank_with_kettlebell_pull, presence: true
  validates :trusters, presence: true
  validates :bent_over_barbell_pull, presence: true
  validates :deadlift, presence: true
  validates :mahi_dumbbells_through_the_sides, presence: true
  validates :dumbbell_layout, presence: true
  validates :barbell_pull_to_chin, presence: true
  validates :forearm_curls_and_press_ups_with_a_barbell, presence: true
  validates :cross_over, presence: true
  validates :abduction_in_a_butterfly, presence: true
  validates :lying_leg_flexion, presence: true
  validates :seated_leg_extension, presence: true
  validates :sumo_squats, presence: true
  validates :farm_walk, presence: true
end
