# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Rails/Metrics/BlockLength
RSpec.describe Crossfit, type: :model do
  let(:user) do
    User.create(name: 'John Doe', email: 'john@example.com', password: 'password123', role: 'basic',
                weight: 70, growth: 180, years: 25, gender: 'male')
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to be_valid
    end

    it 'is not valid without a front_squat' do
      crossfit = user.crossfits.build(hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a hang_grab' do
      crossfit = user.crossfits.build(front_squat: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a overhead_press' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a kettlebell_swing' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a kettlebell_pull_to_the_chin' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      russian_twist: 10, plank_with_kettlebell_pull: 10, trusters: 10,
                                      bent_over_barbell_pull: 10, deadlift: 10,
                                      mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a russian_twist' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, plank_with_kettlebell_pull: 10,
                                      trusters: 10, bent_over_barbell_pull: 10, deadlift: 10,
                                      mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a plank_with_kettlebell_pull' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10, trusters: 10,
                                      bent_over_barbell_pull: 10, deadlift: 10,
                                      mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a trusters' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a bent_over_barbell_pull' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, deadlift: 10,
                                      mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a deadlift' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a mahi_dumbbells_through_the_sides' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, dumbbell_layout: 10, barbell_pull_to_chin: 10,
                                      forearm_curls_and_press_ups_with_a_barbell: 10, cross_over: 10,
                                      abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a dumbbell_layout' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, barbell_pull_to_chin: 10,
                                      forearm_curls_and_press_ups_with_a_barbell: 10, cross_over: 10,
                                      abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a barbell_pull_to_chin' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      forearm_curls_and_press_ups_with_a_barbell: 10, cross_over: 10,
                                      abduction_in_a_butterfly: 10, lying_leg_flexion: 10, seated_leg_extension: 10,
                                      sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a forearm_curls_and_press_ups_with_a_barbell' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, cross_over: 10, abduction_in_a_butterfly: 10,
                                      lying_leg_flexion: 10, seated_leg_extension: 10, sumo_squats: 10,
                                      farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a cross_over' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      abduction_in_a_butterfly: 10, lying_leg_flexion: 10, seated_leg_extension: 10,
                                      sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a abduction_in_a_butterfly' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, lying_leg_flexion: 10, seated_leg_extension: 10,
                                      sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a lying_leg_flexion' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, seated_leg_extension: 10,
                                      sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a seated_leg_extension' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      sumo_squats: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a sumo_squats' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, farm_walk: 10)
      expect(crossfit).to_not be_valid
    end

    it 'is not valid without a farm_walk' do
      crossfit = user.crossfits.build(front_squat: 10, hang_grab: 10, overhead_press: 10, kettlebell_swing: 10,
                                      kettlebell_pull_to_the_chin: 10, russian_twist: 10,
                                      plank_with_kettlebell_pull: 10, trusters: 10, bent_over_barbell_pull: 10,
                                      deadlift: 10, mahi_dumbbells_through_the_sides: 10, dumbbell_layout: 10,
                                      barbell_pull_to_chin: 10, forearm_curls_and_press_ups_with_a_barbell: 10,
                                      cross_over: 10, abduction_in_a_butterfly: 10, lying_leg_flexion: 10,
                                      seated_leg_extension: 10, sumo_squats: 10)
      expect(crossfit).to_not be_valid
    end
  end
end
# rubocop:enable Rails/Metrics/BlockLength
