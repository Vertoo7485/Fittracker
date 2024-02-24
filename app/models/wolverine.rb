class Wolverine < ApplicationRecord
  belongs_to :user

  validates :barbell_bench_press, presence: true
  validates :dumbbell_bench_press, presence: true
  validates :push_ups_on_bars, presence: true
  validates :seated_dumbbell_press, presence: true
  validates :barbell_pull_to_chin, presence: true
  validates :french_bench_press, presence: true
  validates :pull_ups, presence: true
  validates :incline_dumbbell_row, presence: true
  validates :vertical_pull_block, presence: true
  validates :bent_over_barbell_pull, presence: true
  validates :hyperextension, presence: true
  validates :barbell_forearm_curls, presence: true
  validates :incline_dumbbell_mahi, presence: true
  validates :seated_leg_extension, presence: true
  validates :squats, presence: true
  validates :deadlift, presence: true
  validates :leg_press, presence: true
  validates :lying_leg_flexion, presence: true
  validates :standing_calf_raises, presence: true

end
