class Spider < ApplicationRecord
  belongs_to :user

  validates :barbell_bench_press, presence: true
  validates :incline_press, presence: true
  validates :push_ups_on_bars, presence: true
  validates :close_grip_bench_press, presence: true
  validates :seated_dumbbell_press, presence: true
  validates :barbell_pull_to_chin, presence: true
  validates :deadlift, presence: true
  validates :pull_ups, presence: true
  validates :incline_dumbbell_row, presence: true
  validates :horizontal_pull_block, presence: true
  validates :barbell_forearm_curls, presence: true
  validates :squats, presence: true
  validates :leg_press, presence: true
  validates :romanian_deadlift, presence: true
  validates :lunges, presence: true
  validates :standing_calf_raises, presence: true
end
