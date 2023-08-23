module CountPowerTraining
  extend ActiveSupport::Concern

  included do
    private

    def current_training
      @user = User.find params[:user_id]
      @current_training = @user.powers.find params[:id]
    end

    def pump_count_update_training
      new_count_update = current_training.count_update_training + 1
      current_training.update(count_update_training: new_count_update)
    end

    def pump_reps_monday
      monday_reps = 8
      new_monday_reps = current_training.monday_reps + 1
      if current_training.monday_reps <= 9
        current_training.update(monday_reps: new_monday_reps)
      else
        current_training.update(monday_reps: monday_reps)
      end
    end

    def pump_reps_wednesday
      wednesday_reps = 8
      new_wednesday_reps = current_training.wednesday_reps + 1
      if current_training.wednesday_reps <= 9
        current_training.update(wednesday_reps: new_wednesday_reps)
      else
        current_training.update(wednesday_reps: wednesday_reps)
      end
    end

    def pump_reps_friday
      friday_reps = 8
      new_friday_reps = current_training.friday_reps + 1
      if current_training.friday_reps <= 9
        current_training.update(friday_reps: new_friday_reps)
      else
        current_training.update(friday_reps: friday_reps)
      end
    end

    def pump_power_monday
      new_barbell_bench_press = current_training.barbell_bench_press * 1.05
      new_reverse_push_ups = current_training.reverse_push_ups * 1.05
      new_dumbbell_bench_press = current_training.dumbbell_bench_press * 1.05
      new_push_ups_on_bars = current_training.push_ups_on_bars * 1.05
      new_stacked_chest_press = current_training.stacked_chest_press * 1.05
      new_extension_with_rope_handle = current_training.extension_with_rope_handle * 1.05
      new_dumbbell_abduction = current_training.dumbbell_abduction * 1.05
      current_training.update(barbell_bench_press: new_barbell_bench_press,
                              reverse_push_ups: new_reverse_push_ups,
                              dumbbell_bench_press: new_dumbbell_bench_press,
                              push_ups_on_bars: new_push_ups_on_bars, stacked_chest_press: new_stacked_chest_press,
                              extension_with_rope_handle: new_extension_with_rope_handle,
                              dumbbell_abduction: new_dumbbell_abduction)   
    end

    def pump_power_wednesday
      new_horizontal_pull_block = current_training.horizontal_pull_block * 1.05
      new_pull_ups = current_training.pull_ups * 1.05
      new_barbell_forearm_curls = current_training.barbell_forearm_curls * 1.05
      new_incline_dumbbell_row = current_training.incline_dumbbell_row * 1.05
      new_vertical_pull_block = current_training.vertical_pull_block * 1.05
      new_hyperextension = current_training.hyperextension * 1.05
      new_hammers = current_training.hammers * 1.05
      current_training.update(horizontal_pull_block: new_horizontal_pull_block, pull_ups: new_pull_ups,
                              barbell_forearm_curls: new_barbell_forearm_curls,
                              incline_dumbbell_row: new_incline_dumbbell_row,
                              vertical_pull_block: new_vertical_pull_block, hyperextension: new_hyperextension,
                              hammers: new_hammers)
    end

    def pump_power_friday
      new_gack_squats = current_training.gack_squats * 1.05
      new_seated_leg_extension = current_training.seated_leg_extension * 1.05
      new_leg_press = current_training.leg_press * 1.05
      new_hamer_shoulder_press = current_training.hamer_shoulder_press * 1.05
      new_dumbbells_through_the_side = current_training.dumbbells_through_the_side * 1.05
      new_lying_leg_flexion = current_training.lying_leg_flexion * 1.05
      new_pancake_swing_in_front_of_you = current_training.pancake_swing_in_front_of_you * 1.05
      new_barbell_pull_to_chin = current_training.barbell_pull_to_chin * 1.05
      current_training.update(gack_squats: new_gack_squats, seated_leg_extension: new_seated_leg_extension,
                              leg_press: new_leg_press, hamer_shoulder_press: new_hamer_shoulder_press,
                              dumbbells_through_the_side: new_dumbbells_through_the_side,
                              lying_leg_flexion: new_lying_leg_flexion, 
                              pancake_swing_in_front_of_you: new_pancake_swing_in_front_of_you,
                              barbell_pull_to_chin: new_barbell_pull_to_chin)
    end

    helper_method :current_training
  end
end