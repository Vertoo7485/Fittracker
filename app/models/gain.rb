# frozen_string_literal: true

class Gain < ApplicationRecord
  CYRCLES_COUNT_TRAINING = [3, 11, 17, 18, 20, 47].freeze
  TABATS_COUNT_TRAINING = [6, 7, 12, 13, 19, 30, 31].freeze
  CROSSFITS_COUNT_TRAINING = [32, 33, 34, 35, 42, 43, 50, 51].freeze

  belongs_to :user

  attr_accessor :day

  ## validates for monday
  validates :barbell_bench_press, presence: true
  validates :reverse_push_ups, presence: true
  validates :dumbbell_bench_press, presence: true
  validates :push_ups_on_bars, presence: true
  validates :stacked_chest_press, presence: true
  validates :extension_with_rope_handle, presence: true
  validates :dumbbell_abduction, presence: true

  ## validates for wednesday

  validates :horizontal_pull_block, presence: true, on: :update, if: proc { |u| u.day == 'wednesday' }
  validates :pull_ups, presence: true, on: :update, if: proc { |u| u.day == 'wednesday' }
  validates :barbell_forearm_curls, presence: true, on: :update, if: proc { |u| u.day == 'wednesday' }
  validates :incline_dumbbell_row, presence: true, on: :update, if: proc { |u| u.day == 'wednesday' }
  validates :vertical_pull_block, presence: true, on: :update, if: proc { |u| u.day == 'wednesday' }
  validates :hyperextension, presence: true, on: :update, if: proc { |u| u.day == 'wednesday' }
  validates :hammers, presence: true, on: :update, if: proc { |u| u.day == 'wednesday' }

  ## validates for friday

  validates :gack_squats, :seated_leg_extension, presence: true, on: :update, if: proc { |u| u.day == 'friday' }
  validates :seated_leg_extension, presence: true, on: :update, if: proc { |u| u.day == 'friday' }
  validates :hamer_shoulder_press, presence: true, on: :update, if: proc { |u| u.day == 'friday' }
  validates :dumbbells_through_the_side, presence: true, on: :update, if: proc { |u| u.day == 'friday' }
  validates :lying_leg_flexion, presence: true, on: :update, if: proc { |u| u.day == 'friday' }
  validates :pancake_swing_in_front_of_you, presence: true, on: :update, if: proc { |u| u.day == 'friday' }
  validates :barbell_pull_to_chin, presence: true, on: :update, if: proc { |u| u.day == 'friday' }
  validates :leg_press, presence: true, on: :update, if: proc { |u| u.day == 'friday' }

  ## validates for cyrcles

  validates :russian_twist, presence: true, on: :update, if: proc { |u| u.day == 'cyrcles' }
  validates :bent_over_barbell_pull, presence: true, on: :update, if: proc { |u| u.day == 'cyrcles' }
  validates :trapeze_in_smith, presence: true, on: :update, if: proc { |u| u.day == 'cyrcles' }
  validates :lifting_dumbbells_in_scott, presence: true, on: :update, if: proc { |u| u.day == 'cyrcles' }
  validates :biceps_sitting, presence: true, on: :update, if: proc { |u| u.day == 'cyrcles' }
  validates :hull_reversals, presence: true, on: :update, if: proc { |u| u.day == 'cyrcles' }
  validates :standing_dumbbell_french_press, presence: true, on: :update, if: proc { |u| u.day == 'cyrcles' }

  ## validates for crossfit

  validates :front_squat, presence: true, on: :update, if: proc { |u| u.day == 'crossfit' }
  validates :hang_grab, presence: true, on: :update, if: proc { |u| u.day == 'crossfit' }
  validates :overhead_press, presence: true, on: :update, if: proc { |u| u.day == 'crossfit' }
  validates :kettlebell_pull_to_the_chin, presence: true, on: :update, if: proc { |u| u.day == 'crossfit' }
  validates :plank_with_kettlebell_pull, presence: true, on: :update, if: proc { |u| u.day == 'crossfit' }
  validates :deadlift, presence: true, on: :update, if: proc { |u| u.day == 'crossfit' }
  validates :forearm_curls_and_press_ups_with_a_barbell, presence: true, on: :update, if: proc { |u|
                                                                                            u.day == 'crossfit'
                                                                                          }
  validates :cross_over, presence: true, on: :update, if: proc { |u| u.day == 'crossfit' }
  validates :abduction_in_a_butterfly, presence: true, on: :update, if: proc { |u| u.day == 'crossfit' }
  validates :sumo_squats, presence: true, on: :update, if: proc { |u| u.day == 'crossfit' }
  validates :farm_walk, presence: true, on: :update, if: proc { |u| u.day == 'crossfit' }

  ## validates for tabat

  validates :incline_dumbbell_mahi, presence: true, on: :update, if: proc { |u| u.day == 'tabat' }
  validates :trusters, presence: true, on: :update, if: proc { |u| u.day == 'tabat' }
  validates :kettlebell_swing, presence: true, on: :update, if: proc { |u| u.day == 'tabat' }
end
