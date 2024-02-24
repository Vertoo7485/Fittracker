class Batman < ApplicationRecord
  belongs_to :user

  validates :barbell_bench_press, presence: true
  validates :incline_dumbbell_press, presence: true
  validates :push_ups_on_bars, presence: true
  validates :overhead_press, presence: true
  validates :barbell_pull_to_chin, presence: true
  validates :dumbbells_through_the_side, presence: true
  validates :french_bench_press, presence: true
  validates :deadlift, presence: true
  validates :pull_ups, presence: true
  validates :bent_over_barbell_pull, presence: true
  validates :vertical_pull_block, presence: true
  validates :horizontal_pull_block, presence: true
  validates :barbell_forearm_curls, presence: true
  validates :lifting_dumbbells_in_scott, presence: true
  validates :incline_dumbbell_mahi, presence: true
  validates :seated_leg_extension, presence: true
  validates :squats, presence: true
  validates :leg_press, presence: true
  validates :lunges, presence: true
  validates :lying_leg_flexion, presence: true
  validates :standing_calf_raises, presence: true
end
