# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Gain, type: :model do
  let(:user) do
    User.create(name: 'John Doe', email: 'john@example.com', password: 'password123', role: 'basic',
                weight: 70, growth: 180, years: 25, gender: 'male')
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      gain = user.gains.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                              push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10,
                              dumbbell_abduction: 10)
      expect(gain).to be_valid
    end

    it 'is not valid without a barbell_bench_press' do
      gain = user.gains.build(reverse_push_ups: 10, dumbbell_bench_press: 10,
                              push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10,
                              dumbbell_abduction: 10)
      expect(gain).to_not be_valid
    end

    it 'is not valid without a reverse_push_ups' do
      gain = user.gains.build(barbell_bench_press: 10, dumbbell_bench_press: 10, push_ups_on_bars: 10,
                              stacked_chest_press: 10, extension_with_rope_handle: 10, dumbbell_abduction: 10)
      expect(gain).to_not be_valid
    end

    it 'is not valid without a dumbbell_bench_press' do
      gain = user.gains.build(barbell_bench_press: 10, reverse_push_ups: 10, push_ups_on_bars: 10,
                              stacked_chest_press: 10, extension_with_rope_handle: 10, dumbbell_abduction: 10)
      expect(gain).to_not be_valid
    end

    it 'is not valid without a push_ups_on_bars' do
      gain = user.gains.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                              stacked_chest_press: 10, extension_with_rope_handle: 10, dumbbell_abduction: 10)
      expect(gain).to_not be_valid
    end

    it 'is not valid without a stacked_chest_press' do
      gain = user.gains.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                              push_ups_on_bars: 10, extension_with_rope_handle: 10, dumbbell_abduction: 10)
      expect(gain).to_not be_valid
    end

    it 'is not valid without a extension_with_rope_handle' do
      gain = user.gains.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10, push_ups_on_bars: 10,
                              stacked_chest_press: 10, dumbbell_abduction: 10)
      expect(gain).to_not be_valid
    end

    it 'is not valid without a dumbbell_abduction' do
      gain = user.gains.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10, push_ups_on_bars: 10,
                              stacked_chest_press: 10, extension_with_rope_handle: 10)
      expect(gain).to_not be_valid
    end
  end

  context 'on Wednesday' do
    it 'validates presence of horizontal_pull_block on update' do
      gain = user.gains.build(day: 'wednesday')
      expect(gain).to validate_presence_of(:horizontal_pull_block).on(:update)
    end

    it 'validates presence of pull_ups on update' do
      gain = user.gains.build(day: 'wednesday')
      expect(gain).to validate_presence_of(:pull_ups).on(:update)
    end

    it 'validates presence of barbell_forearm_curls on update' do
      gain = user.gains.build(day: 'wednesday')
      expect(gain).to validate_presence_of(:barbell_forearm_curls).on(:update)
    end

    it 'validates presence of incline_dumbbell_row on update' do
      gain = user.gains.build(day: 'wednesday')
      expect(gain).to validate_presence_of(:incline_dumbbell_row).on(:update)
    end

    it 'validates presence of vertical_pull_block on update' do
      gain = user.gains.build(day: 'wednesday')
      expect(gain).to validate_presence_of(:vertical_pull_block).on(:update)
    end

    it 'validates presence of hyperextension on update' do
      gain = user.gains.build(day: 'wednesday')
      expect(gain).to validate_presence_of(:hyperextension).on(:update)
    end

    it 'validates presence of hammers on update' do
      gain = user.gains.build(day: 'wednesday')
      expect(gain).to validate_presence_of(:hammers).on(:update)
    end

    it 'not validates presence of horizontal_pull_block on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to_not validate_presence_of(:horizontal_pull_block).on(:update)
    end

    it 'not validates presence of pull_ups on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to_not validate_presence_of(:pull_ups).on(:update)
    end

    it 'not validates presence of barbell_forearm_curls on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to_not validate_presence_of(:barbell_forearm_curls).on(:update)
    end

    it 'not validates presence of incline_dumbbell_row on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to_not validate_presence_of(:incline_dumbbell_row).on(:update)
    end

    it 'not validates presence of vertical_pull_block on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to_not validate_presence_of(:vertical_pull_block).on(:update)
    end

    it 'not validates presence of hyperextension on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to_not validate_presence_of(:hyperextension).on(:update)
    end

    it 'notvalidates presence of hammers on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to_not validate_presence_of(:hammers).on(:update)
    end
  end

  context 'on Friday' do
    it 'validates presence of gack_squats on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to validate_presence_of(:gack_squats).on(:update)
    end

    it 'validates presence of seated_leg_extension on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to validate_presence_of(:seated_leg_extension).on(:update)
    end

    it 'validates presence of hamer_shoulder_press on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to validate_presence_of(:hamer_shoulder_press).on(:update)
    end

    it 'validates presence of dumbbells_through_the_side on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to validate_presence_of(:dumbbells_through_the_side).on(:update)
    end

    it 'validates presence of lying_leg_flexion on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to validate_presence_of(:lying_leg_flexion).on(:update)
    end

    it 'validates presence of pancake_swing_in_front_of_you on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to validate_presence_of(:pancake_swing_in_front_of_you).on(:update)
    end

    it 'validates presence of barbell_pull_to_chin on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to validate_presence_of(:barbell_pull_to_chin).on(:update)
    end

    it 'validates presence of leg_press on update' do
      gain = user.gains.build(day: 'friday')
      expect(gain).to validate_presence_of(:leg_press).on(:update)
    end

    it 'not validates presence of gack_squats on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:gack_squats).on(:update)
    end

    it 'not validates presence of seated_leg_extension on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:seated_leg_extension).on(:update)
    end

    it 'not validates presence of hamer_shoulder_press on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:hamer_shoulder_press).on(:update)
    end

    it 'not validates presence of dumbbells_through_the_side on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:dumbbells_through_the_side).on(:update)
    end

    it 'not validates presence of lying_leg_flexion on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:lying_leg_flexion).on(:update)
    end

    it 'not validates presence of pancake_swing_in_front_of_you on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:pancake_swing_in_front_of_you).on(:update)
    end

    it 'not validates presence of barbell_pull_to_chin on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:barbell_pull_to_chin).on(:update)
    end

    it 'not validates presence of leg_press on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:leg_press).on(:update)
    end
  end

  context 'on Cyrcles' do
    it 'validates presence of russian_twist on update' do
      gain = user.gains.build(day: 'cyrcles')
      expect(gain).to validate_presence_of(:russian_twist).on(:update)
    end

    it 'validates presence of bent_over_barbell_pull on update' do
      gain = user.gains.build(day: 'cyrcles')
      expect(gain).to validate_presence_of(:bent_over_barbell_pull).on(:update)
    end

    it 'validates presence of trapeze_in_smith on update' do
      gain = user.gains.build(day: 'cyrcles')
      expect(gain).to validate_presence_of(:trapeze_in_smith).on(:update)
    end

    it 'validates presence of lifting_dumbbells_in_scott on update' do
      gain = user.gains.build(day: 'cyrcles')
      expect(gain).to validate_presence_of(:lifting_dumbbells_in_scott).on(:update)
    end

    it 'validates presence of biceps_sitting on update' do
      gain = user.gains.build(day: 'cyrcles')
      expect(gain).to validate_presence_of(:biceps_sitting).on(:update)
    end

    it 'validates presence of hull_reversals on update' do
      gain = user.gains.build(day: 'cyrcles')
      expect(gain).to validate_presence_of(:hull_reversals).on(:update)
    end

    it 'validates presence of standing_dumbbell_french_press on update' do
      gain = user.gains.build(day: 'cyrcles')
      expect(gain).to validate_presence_of(:standing_dumbbell_french_press).on(:update)
    end

    it 'not validates presence of russian_twist on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:russian_twist).on(:update)
    end

    it 'not validates presence of bent_over_barbell_pull on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:bent_over_barbell_pull).on(:update)
    end

    it 'not validates presence of trapeze_in_smith on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:trapeze_in_smith).on(:update)
    end

    it 'not validates presence of lifting_dumbbells_in_scott on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:lifting_dumbbells_in_scott).on(:update)
    end

    it 'not validates presence of biceps_sitting on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:biceps_sitting).on(:update)
    end

    it 'not validates presence of hull_reversals on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:hull_reversals).on(:update)
    end

    it 'not validates presence of standing_dumbbell_french_press on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:standing_dumbbell_french_press).on(:update)
    end
  end

  context 'on Crossfit' do
    it 'validates presence of front_squat on update' do
      gain = user.gains.build(day: 'crossfit')
      expect(gain).to validate_presence_of(:front_squat).on(:update)
    end

    it 'validates presence of hang_grab on update' do
      gain = user.gains.build(day: 'crossfit')
      expect(gain).to validate_presence_of(:hang_grab).on(:update)
    end

    it 'validates presence of overhead_press on update' do
      gain = user.gains.build(day: 'crossfit')
      expect(gain).to validate_presence_of(:overhead_press).on(:update)
    end

    it 'validates presence of kettlebell_pull_to_the_chin on update' do
      gain = user.gains.build(day: 'crossfit')
      expect(gain).to validate_presence_of(:kettlebell_pull_to_the_chin).on(:update)
    end

    it 'validates presence of plank_with_kettlebell_pull on update' do
      gain = user.gains.build(day: 'crossfit')
      expect(gain).to validate_presence_of(:plank_with_kettlebell_pull).on(:update)
    end

    it 'validates presence of deadlift on update' do
      gain = user.gains.build(day: 'crossfit')
      expect(gain).to validate_presence_of(:deadlift).on(:update)
    end

    it 'validates presence of forearm_curls_and_press_ups_with_a_barbell on update' do
      gain = user.gains.build(day: 'crossfit')
      expect(gain).to validate_presence_of(:forearm_curls_and_press_ups_with_a_barbell).on(:update)
    end

    it 'validates presence of cross_over on update' do
      gain = user.gains.build(day: 'crossfit')
      expect(gain).to validate_presence_of(:cross_over).on(:update)
    end

    it 'validates presence of abduction_in_a_butterfly on update' do
      gain = user.gains.build(day: 'crossfit')
      expect(gain).to validate_presence_of(:abduction_in_a_butterfly).on(:update)
    end

    it 'validates presence of sumo_squats on update' do
      gain = user.gains.build(day: 'crossfit')
      expect(gain).to validate_presence_of(:sumo_squats).on(:update)
    end

    it 'validates presence of farm_walk on update' do
      gain = user.gains.build(day: 'crossfit')
      expect(gain).to validate_presence_of(:farm_walk).on(:update)
    end

    it 'not validates presence of front_squat on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:front_squat).on(:update)
    end

    it 'not validates presence of hang_grab on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:hang_grab).on(:update)
    end

    it 'not validates presence of overhead_press on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:overhead_press).on(:update)
    end

    it 'not validates presence of kettlebell_pull_to_the_chin on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:kettlebell_pull_to_the_chin).on(:update)
    end

    it 'not validates presence of plank_with_kettlebell_pull on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:plank_with_kettlebell_pull).on(:update)
    end

    it 'not validates presence of deadlift on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:deadlift).on(:update)
    end

    it 'not validates presence of forearm_curls_and_press_ups_with_a_barbell on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:forearm_curls_and_press_ups_with_a_barbell).on(:update)
    end

    it 'not validates presence of cross_over on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:cross_over).on(:update)
    end

    it 'not validates presence of abduction_in_a_butterfly on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:abduction_in_a_butterfly).on(:update)
    end

    it 'not validates presence of sumo_squats on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:sumo_squats).on(:update)
    end

    it 'not validates presence of farm_walk on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:farm_walk).on(:update)
    end
  end

  context 'on Tabat' do
    it 'validates presence of incline_dumbbell_mahi on update' do
      gain = user.gains.build(day: 'tabat')
      expect(gain).to validate_presence_of(:incline_dumbbell_mahi).on(:update)
    end

    it 'validates presence of trusters on update' do
      gain = user.gains.build(day: 'tabat')
      expect(gain).to validate_presence_of(:trusters).on(:update)
    end

    it 'validates presence of kettlebell_swing on update' do
      gain = user.gains.build(day: 'tabat')
      expect(gain).to validate_presence_of(:kettlebell_swing).on(:update)
    end

    it 'not validates presence of incline_dumbbell_mahi on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:incline_dumbbell_mahi).on(:update)
    end

    it 'not validates presence of trusters on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:trusters).on(:update)
    end

    it 'not validates presence of kettlebell_swing on update' do
      gain = user.gains.build(day: 'monday')
      expect(gain).to_not validate_presence_of(:kettlebell_swing).on(:update)
    end
  end
end
