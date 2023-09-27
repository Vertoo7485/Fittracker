# frozen_string_literal: true

module CountGainTraining
  extend ActiveSupport::Concern

  included do
    private

    def current_gain_training
      @user = User.find params[:user_id]
      @current_gain_training = @user.gains.find params[:id]
    end

    def pump_gain_count_update_training
      new_count_update = current_gain_training.count_update_training + 1
      current_gain_training.update(count_update_training: new_count_update)
    end

    def pump_gain_reps_monday
      monday_reps = 8
      new_monday_reps = current_gain_training.monday_reps + 1
      if current_gain_training.monday_reps <= 9
        current_gain_training.update(monday_reps: new_monday_reps)
      else
        current_gain_training.update(monday_reps:)
      end
    end

    def pump_gain_reps_wednesday
      wednesday_reps = 8
      new_wednesday_reps = current_gain_training.wednesday_reps + 1
      if current_gain_training.wednesday_reps <= 9
        current_gain_training.update(wednesday_reps: new_wednesday_reps)
      else
        current_gain_training.update(wednesday_reps:)
      end
    end

    def pump_gain_reps_friday
      friday_reps = 8
      new_friday_reps = current_gain_training.friday_reps + 1
      if current_gain_training.friday_reps <= 9
        current_gain_training.update(friday_reps: new_friday_reps)
      else
        current_gain_training.update(friday_reps:)
      end
    end

    def pump_gain_monday
      current_gain_training.update(
        barbell_bench_press: current_gain_training.barbell_bench_press * 1.05,
        reverse_push_ups: current_gain_training.reverse_push_ups * 1.05,
        dumbbell_bench_press: current_gain_training.dumbbell_bench_press * 1.05,
        push_ups_on_bars: current_gain_training.push_ups_on_bars * 1.05,
        stacked_chest_press: current_gain_training.stacked_chest_press * 1.05,
        extension_with_rope_handle: current_gain_training.extension_with_rope_handle * 1.05,
        dumbbell_abduction: current_gain_training.dumbbell_abduction * 1.05
      )
    end

    def pump_gain_wednesday
      current_gain_training.update(
        horizontal_pull_block: current_gain_training.horizontal_pull_block * 1.05,
        pull_ups: current_gain_training.pull_ups * 1.05,
        barbell_forearm_curls: current_gain_training.barbell_forearm_curls * 1.05,
        incline_dumbbell_row: current_gain_training.incline_dumbbell_row * 1.05,
        vertical_pull_block: current_gain_training.vertical_pull_block * 1.05,
        hyperextension: current_gain_training.hyperextension * 1.05,
        hammers: current_gain_training.hammers * 1.05
      )
    end

    def pump_gain_friday
      current_gain_training.update(
        gack_squats: current_gain_training.gack_squats * 1.05,
        seated_leg_extension: current_gain_training.seated_leg_extension * 1.05,
        leg_press: current_gain_training.leg_press * 1.05,
        hamer_shoulder_press: current_gain_training.hamer_shoulder_press * 1.05,
        dumbbells_through_the_side: current_gain_training.dumbbells_through_the_side * 1.05,
        lying_leg_flexion: current_gain_training.lying_leg_flexion * 1.05,
        pancake_swing_in_front_of_you: current_gain_training.pancake_swing_in_front_of_you * 1.05,
        barbell_pull_to_chin: current_gain_training.barbell_pull_to_chin * 1.05
      )
    end

    def pump_gain_crossfit_monday
      current_gain_training.update(
        front_squat: current_gain_training.front_squat * 1.05,
        hang_grab: current_gain_training.hang_grab * 1.05,
        overhead_press: current_gain_training.overhead_press * 1.05,
        kettlebell_swing: current_gain_training.kettlebell_swing * 1.05,
        kettlebell_pull_to_the_chin: current_gain_training.kettlebell_pull_to_the_chin * 1.05,
        russian_twist: current_gain_training.russian_twist * 1.05,
        plank_with_kettlebell_pull: current_gain_training.plank_with_kettlebell_pull * 1.05
      )
    end

    def pump_gain_crossfit_wednesday
      current_gain_training.update(
        trusters: current_gain_training.trusters * 1.05,
        bent_over_barbell_pull: current_gain_training.bent_over_barbell_pull * 1.05,
        deadlift: current_gain_training.deadlift * 1.05,
        dumbbells_through_the_side: current_gain_training.dumbbells_through_the_side * 1.05,
        dumbbell_layout: current_gain_training.dumbbell_layout * 1.05,
        barbell_pull_to_chin: current_gain_training.barbell_pull_to_chin * 1.05
      )
    end

    def pump_gain_crossfit_friday
      current_gain_training.update(
        forearm_curls_and_press_ups_with_a_barbell: current_gain_training.forearm_curls_and_press_ups_with_a_barbell * 1.05,
        cross_over: current_gain_training.cross_over * 1.05,
        abduction_in_a_butterfly: current_gain_training.abduction_in_a_butterfly * 1.05,
        lying_leg_flexion: current_gain_training.lying_leg_flexion * 1.05,
        seated_leg_extension: current_gain_training.seated_leg_extension * 1.05,
        sumo_squats: current_gain_training.sumo_squats * 1.05,
        farm_walk: current_gain_training.farm_walk * 1.05,
        kettlebell_swing: current_gain_training.kettlebell_swing * 1.05
      )
    end

    def pump_gain_tabat_monday_reps
      monday_reps = 30
      new_monday_sets = 5
      if current_gain_training.monday_tabat_reps <= 40
        current_gain_training.update(monday_tabat_reps: current_gain_training.monday_tabat_reps + 5)
      else
        current_gain_training.update(monday_tabat_sets: new_monday_sets)
      end
    end

    def pump_gain_tabat_wednesday_reps
      wednesday_reps = 30
      new_wednesday_sets = 5
      if current_gain_training.wednesday_tabat_reps <= 40
        current_gain_training.update(wednesday_tabat_reps: current_gain_training.wednesday_tabat_reps + 5)
      else
        current_gain_training.update(wednesday_tabat_sets: new_wednesday_sets)
      end
    end

    def pump_gain_tabat_friday_reps
      friday_reps = 30
      new_friday_sets = 5
      if current_gain_training.friday_tabat_reps <= 40
        current_gain_training.update(friday_tabat_reps: current_gain_training.friday_tabat_reps + 5)
      else
        current_gain_training.update(friday_tabat_sets: new_friday_sets)
      end
    end

    def pump_gain_tabat_monday
      current_gain_training.update(
        dumbbells_through_the_side: current_gain_training.dumbbells_through_the_side * 1.05,
        incline_dumbbell_mahi: current_gain_training.incline_dumbbell_mahi * 1.05
      )
    end

    def pump_gain_tabat_wednesday
      current_gain_training.update(
        trusters: current_gain_training.trusters * 1.05,
        kettlebell_swing: current_gain_training.kettlebell_swing * 1.05
      )
    end

    def pump_gain_tabat_friday
      current_gain_training.update(barbell_forearm_curls: current_gain_training.barbell_forearm_curls * 1.05)
    end

    def pump_gain_cyrcles_monday
      current_gain_training.update(
        leg_press: current_gain_training.leg_press * 1.05,
        hammers: current_gain_training.hammers * 1.05,
        barbell_pull_to_chin: current_gain_training.barbell_pull_to_chin * 1.05,
        russian_twist: current_gain_training.russian_twist * 1.05,
        track: current_gain_training.track * 1.05
      )
    end

    def pump_gain_cyrcles_wednesday
      current_gain_training.update(
        bent_over_barbell_pull: current_gain_training.bent_over_barbell_pull * 1.05,
        trapeze_in_smith: current_gain_training.trapeze_in_smith * 1.05,
        vertical_pull_block: current_gain_training.vertical_pull_block * 1.05,
        lifting_dumbbells_in_scott: current_gain_training.lifting_dumbbells_in_scott * 1.05,
        biceps_sitting: current_gain_training.biceps_sitting * 1.05,
        hull_reversals: current_gain_training.hull_reversals * 1.05,
        dumbbells_through_the_side: current_gain_training.dumbbells_through_the_side * 1.05
      )
    end

    def pump_gain_cyrcles_friday
      current_gain_training.update(
        leg_press: current_gain_training.leg_press * 1.05,
        dumbbell_bench_press: current_gain_training.dumbbell_bench_press * 1.05,
        barbell_forearm_curls: current_gain_training.barbell_forearm_curls * 1.05,
        standing_dumbbell_french_press: current_gain_training.standing_dumbbell_french_press * 1.05,
        track: current_gain_training.track * 1.05
      )
    end

    helper_method :current_gain_training, :pump_gain_count_update_training
  end
end
