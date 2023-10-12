require 'rails_helper'

RSpec.describe Power, type: :model do
  let(:user) { User.create(name: "John Doe", email: "john@example.com", password: "password123", role: "basic",
    weight: 70, growth: 180, years: 25, gender: "male") }
  describe "validations" do
    it "is valid with valid attributes" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
        dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
        barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
        hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
        hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
        pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10)
      expect(power).to be_valid
    end

    it "is not valid without a barbell_bench_press" do
      power = user.powers.build(reverse_push_ups: 10, dumbbell_bench_press: 10, push_ups_on_bars: 10, 
                        stacked_chest_press: 10, extension_with_rope_handle: 10, dumbbell_abduction: 10, 
                        horizontal_pull_block: 10, pull_ups: 10, barbell_forearm_curls: 10,
                        incline_dumbbell_row: 10, vertical_pull_block: 10, hyperextension: 10, hammers: 10, 
                        gack_squats: 10, seated_leg_extension: 10, leg_press: 10, hamer_shoulder_press: 10, 
                        dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
                        pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a reverse_push_ups" do
      power = user.powers.build(barbell_bench_press: 10, dumbbell_bench_press: 10, push_ups_on_bars: 10,
                        stacked_chest_press: 10, extension_with_rope_handle: 10, dumbbell_abduction: 10,
                        horizontal_pull_block: 10, pull_ups: 10, barbell_forearm_curls: 10, 
                        incline_dumbbell_row: 10, vertical_pull_block: 10,hyperextension: 10, hammers: 10,
                        gack_squats: 10, seated_leg_extension: 10, leg_press: 10, hamer_shoulder_press: 10,
                        dumbbells_through_the_side: 10, lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a dumbbell_bench_press" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, push_ups_on_bars: 10,
                        stacked_chest_press: 10, extension_with_rope_handle: 10, dumbbell_abduction: 10,
                        horizontal_pull_block: 10, pull_ups: 10, barbell_forearm_curls: 10,
                        incline_dumbbell_row: 10, vertical_pull_block: 10, hyperextension: 10, hammers: 10,
                        gack_squats: 10, seated_leg_extension: 10, leg_press: 10, hamer_shoulder_press: 10,
                        dumbbells_through_the_side: 10, lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a push_ups_on_bars" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        stacked_chest_press: 10, extension_with_rope_handle: 10, dumbbell_abduction: 10,
                        horizontal_pull_block: 10, pull_ups: 10, barbell_forearm_curls: 10,
                        incline_dumbbell_row: 10, vertical_pull_block: 10, hyperextension: 10, hammers: 10,
                        gack_squats: 10, seated_leg_extension: 10, leg_press: 10, hamer_shoulder_press: 10,
                        dumbbells_through_the_side: 10, lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a stacked_chest_press" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, extension_with_rope_handle: 10, dumbbell_abduction: 10,
                        horizontal_pull_block: 10, pull_ups: 10, barbell_forearm_curls: 10,
                        incline_dumbbell_row: 10, vertical_pull_block: 10, hyperextension: 10, hammers: 10,
                        gack_squats: 10, seated_leg_extension: 10, leg_press: 10, hamer_shoulder_press: 10,
                        dumbbells_through_the_side: 10, lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a extension_with_rope_handle" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, dumbbell_abduction: 10,
                        horizontal_pull_block: 10, pull_ups: 10, barbell_forearm_curls: 10,
                        incline_dumbbell_row: 10, vertical_pull_block: 10, hyperextension: 10, hammers: 10,
                        gack_squats: 10, seated_leg_extension: 10, leg_press: 10, hamer_shoulder_press: 10,
                        dumbbells_through_the_side: 10, lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a dumbbell_abduction" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        horizontal_pull_block: 10, pull_ups: 10, barbell_forearm_curls: 10,
                        incline_dumbbell_row: 10, vertical_pull_block: 10, hyperextension: 10, hammers: 10,
                        gack_squats: 10, seated_leg_extension: 10, leg_press: 10, hamer_shoulder_press: 10,
                        dumbbells_through_the_side: 10, lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a horizontal_pull_block" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, pull_ups: 10, barbell_forearm_curls: 10, incline_dumbbell_row: 10,
                        vertical_pull_block: 10, hyperextension: 10, hammers: 10, gack_squats: 10,
                        seated_leg_extension: 10, leg_press: 10, hamer_shoulder_press: 10,
                        dumbbells_through_the_side: 10, lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a pull_ups" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, horizontal_pull_block: 10, barbell_forearm_curls: 10,
                        incline_dumbbell_row: 10, vertical_pull_block: 10, hyperextension: 10, hammers: 10,
                        gack_squats: 10, seated_leg_extension: 10, leg_press: 10, hamer_shoulder_press: 10,
                        dumbbells_through_the_side: 10, lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a barbell_forearm_curls" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, incline_dumbbell_row: 10,
                        vertical_pull_block: 10, hyperextension: 10, hammers: 10, gack_squats: 10,
                        seated_leg_extension: 10, leg_press: 10, hamer_shoulder_press: 10,
                        dumbbells_through_the_side: 10, lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a incline_dumbbell_row" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
                        barbell_forearm_curls: 10, vertical_pull_block: 10, hyperextension: 10, hammers: 10,
                        gack_squats: 10, seated_leg_extension: 10, leg_press: 10, hamer_shoulder_press: 10,
                        dumbbells_through_the_side: 10, lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a vertical_pull_block" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
                        barbell_forearm_curls: 10, incline_dumbbell_row: 10, hyperextension: 10, hammers: 10,
                        gack_squats: 10, seated_leg_extension: 10, leg_press: 10, hamer_shoulder_press: 10,
                        dumbbells_through_the_side: 10, lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a hyperextension" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
                        barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
                        hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
                        hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
                        pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a hammers" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10,
                        barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
                        hyperextension: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
                        hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
                        pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a gack_squats" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
                        barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
                        hyperextension: 10, hammers: 10, seated_leg_extension: 10, leg_press: 10, 
                        hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
                        pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a seated_leg_extension" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
                        barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
                        hyperextension: 10, hammers: 10, gack_squats: 10, leg_press: 10, hamer_shoulder_press: 10,
                        dumbbells_through_the_side: 10, lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a leg_press" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
                        barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
                        hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, 
                        hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
                        pancake_swing_in_front_of_you: 10, barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a hamer_shoulder_press" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
                        barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
                        hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
                        dumbbells_through_the_side: 10, lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a dumbbells_through_the_side" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
                        barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
                        hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
                        hamer_shoulder_press: 10, lying_leg_flexion: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a lying_leg_flexion" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
                        barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
                        hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
                        hamer_shoulder_press: 10, dumbbells_through_the_side: 10, pancake_swing_in_front_of_you: 10,
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a pancake_swing_in_front_of_you" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
                        barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
                        hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
                        hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
                        barbell_pull_to_chin: 10)
      expect(power).to_not be_valid
    end

    it "is not valid without a barbell_pull_to_chin" do
      power = user.powers.build(barbell_bench_press: 10, reverse_push_ups: 10, dumbbell_bench_press: 10,
                        push_ups_on_bars: 10, stacked_chest_press: 10, extension_with_rope_handle: 10, 
                        dumbbell_abduction: 10, horizontal_pull_block: 10, pull_ups: 10, 
                        barbell_forearm_curls: 10, incline_dumbbell_row: 10, vertical_pull_block: 10,
                        hyperextension: 10, hammers: 10, gack_squats: 10, seated_leg_extension: 10, leg_press: 10, 
                        hamer_shoulder_press: 10, dumbbells_through_the_side: 10, lying_leg_flexion: 10, 
                        pancake_swing_in_front_of_you: 10)
      expect(power).to_not be_valid
    end
  end
end
