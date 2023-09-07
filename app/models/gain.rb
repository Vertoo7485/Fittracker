class Gain < ApplicationRecord

  CYRCLES_COUNT_TRAINING = [3, 11, 17, 18, 20, 47]
  TABATS_COUNT_TRAINING = [6, 7, 12, 13, 19, 30, 31]
  CROSSFITS_COUNT_TRAINING = [32, 33, 34, 35, 42, 43, 50, 51]

  belongs_to :user

  validates :barbell_bench_press, presence: true
  validates :reverse_push_ups, presence: true
  validates :dumbbell_bench_press, presence: true
  validates :push_ups_on_bars, presence: true
  validates :stacked_chest_press, presence: true
  validates :extension_with_rope_handle, presence: true
  validates :dumbbell_abduction, presence: true
  validates :horizontal_pull_block, presence: true
  validates :pull_ups, presence: true
  validates :barbell_forearm_curls, presence: true
  validates :incline_dumbbell_row, presence: true
  validates :vertical_pull_block, presence: true
  validates :hyperextension, presence: true
  validates :hammers, presence: true
  validates :gack_squats, presence: true
  validates :seated_leg_extension, presence: true
  validates :hamer_shoulder_press, presence: true
  validates :dumbbells_through_the_side, presence: true
  validates :lying_leg_flexion, presence: true
  validates :pancake_swing_in_front_of_you, presence: true
  validates :barbell_pull_to_chin, presence: true
  validates :leg_press, presence: true

end
