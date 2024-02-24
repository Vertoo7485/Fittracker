module CountWolverineTraining
  extend ActiveSupport::Concern

  included do
    private

    def current_wolverine_training
      @user = User.find params[:user_id]
      @current_wolverine_training = @user.wolverines.find params[:id]
    end

    def pump_count_update_training
      new_count_update_training = current_wolverine_training.count_update_training + 1
      current_wolverine_training.update(count_update_training: new_count_update_training)
    end

    def pump_monday_reps
      monday_reps = 8
      new_monday_reps = current_wolverine_training.monday_reps + 1
      if current_wolverine_training.monday_reps <= 9
        current_wolverine_training.update(monday_reps: new_monday_reps)
      else
        current_wolverine_training.update(monday_reps:)
      end
    end

    def pump_wednesday_reps
      wednesday_reps = 8
      new_wednesday_reps = current_wolverine_training.wednesday_reps + 1
      if current_wolverine_training.wednesday_reps <= 9
        current_wolverine_training.update(wednesday_reps: new_wednesday_reps)
      else
        current_wolverine_training.update(wednesday_reps:)
      end
    end

    def pump_friday_reps
      friday_reps = 8
      new_friday_reps = current_wolverine_training.friday_reps + 1
      if current_wolverine_training.friday_reps <= 9
        current_wolverine_training.update(friday_reps: new_friday_reps)
      else
        current_wolverine_training.update(friday_reps:)
      end
    end

    def pump_wolverine_monday
      new_barbell_bench_press = current_wolverine_training.barbell_bench_press * 1.05
      new_dumbbell_bench_press = current_wolverine_training.dumbbell_bench_press * 1.05
      new_push_ups_on_bars = current_wolverine_training.push_ups_on_bars * 1.05
      new_seated_dumbbell_press = current_wolverine_training.seated_dumbbell_press * 1.05
      new_barbell_pull_to_chin = current_wolverine_training.barbell_pull_to_chin * 1.05
      new_french_bench_press = current_wolverine_training.french_bench_press * 1.05
      current_wolverine_training.update(barbell_bench_press: new_barbell_bench_press,
                              dumbbell_bench_press: new_dumbbell_bench_press,
                              push_ups_on_bars: new_push_ups_on_bars,
                              seated_dumbbell_press: new_seated_dumbbell_press,
                              barbell_pull_to_chin: new_barbell_pull_to_chin,
                              french_bench_press: new_french_bench_press)
    end

    def pump_wolverine_wednesday
      new_pull_ups = current_wolverine_training.pull_ups * 1.05
      new_incline_dumbbell_row = current_wolverine_training.incline_dumbbell_row * 1.05
      new_vertical_pull_block = current_wolverine_training.vertical_pull_block * 1.05
      new_bent_over_barbell_pull = current_wolverine_training.bent_over_barbell_pull * 1.05
      new_hyperextension = current_wolverine_training.hyperextension * 1.05
      new_barbell_forearm_curls = current_wolverine_training.barbell_forearm_curls * 1.05
      new_incline_dumbbell_mahi = current_wolverine_training.incline_dumbbell_mahi * 1.05
      current_wolverine_training.update(pull_ups: new_pull_ups, incline_dumbbell_row: new_incline_dumbbell_row,
                                        vertical_pull_block: new_vertical_pull_block,
                                        bent_over_barbell_pull: new_bent_over_barbell_pull,
                                        hyperextension: new_hyperextension,
                                        barbell_forearm_curls: new_barbell_forearm_curls,
                                        incline_dumbbell_mahi: new_incline_dumbbell_mahi)
    end

    def pump_wolverine_friday
      new_seated_leg_extension = current_wolverine_training.seated_leg_extension * 1.05
      new_squats = current_wolverine_training.squats * 1.05
      new_leg_press = current_wolverine_training.leg_press * 1.05
      new_lying_leg_flexion = current_wolverine_training.lying_leg_flexion * 1.05
      new_deadlift = current_wolverine_training.deadlift * 1.05
      new_standing_calf_raises = current_wolverine_training.standing_calf_raises * 1.05
      current_wolverine_training.update(seated_leg_extension: new_seated_leg_extension, squats: new_squats,
                              leg_press: new_leg_press, lying_leg_flexion: new_lying_leg_flexion,
                              deadlift: new_deadlift, standing_calf_raises: new_standing_calf_raises)
    end

    helper_method :current_wolverine_training
  end
end