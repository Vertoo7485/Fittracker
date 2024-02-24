module CountBatmanTraining
  extend ActiveSupport::Concern

  included do
    private

    def current_batman_training
      @user = User.find params[:user_id]
      @current_batman_training = @user.batmen.find params[:id]
    end

    def pump_count_update_training
      new_count_update_training = current_batman_training.count_update_training + 1
      current_batman_training.update(count_update_training: new_count_update_training)
    end

    def pump_monday_reps
      monday_reps = 8
      new_monday_reps = current_batman_training.monday_reps + 1
      if current_batman_training.monday_reps <= 9
        current_batman_training.update(monday_reps: new_monday_reps)
      else
        current_batman_training.update(monday_reps:)
      end
    end

    def pump_wednesday_reps
      wednesday_reps = 8
      new_wednesday_reps = current_batman_training.wednesday_reps + 1
      if current_batman_training.wednesday_reps <= 9
        current_batman_training.update(wednesday_reps: new_wednesday_reps)
      else
        current_batman_training.update(wednesday_reps:)
      end
    end

    def pump_friday_reps
      friday_reps = 8
      new_friday_reps = current_batman_training.friday_reps + 1
      if current_batman_training.friday_reps <= 9
        current_batman_training.update(friday_reps: new_friday_reps)
      else
        current_batman_training.update(friday_reps:)
      end
    end

    def pump_batman_monday
      new_barbell_bench_press = current_batman_training.barbell_bench_press * 1.05
      new_incline_dumbbell_press = current_batman_training.incline_dumbbell_press * 1.05
      new_push_ups_on_bars = current_batman_training.push_ups_on_bars * 1.05
      new_overhead_press = current_batman_training.overhead_press * 1.05
      new_barbell_pull_to_chin = current_batman_training.barbell_pull_to_chin * 1.05
      new_lying_leg_flexion = current_batman_training.lying_leg_flexion * 1.05
      new_french_bench_press = current_batman_training.french_bench_press * 1.05
      current_batman_training.update(barbell_bench_press: new_barbell_bench_press,
                              incline_dumbbell_press: new_incline_dumbbell_press,
                              push_ups_on_bars: new_push_ups_on_bars,
                              overhead_press: new_overhead_press, barbell_pull_to_chin: new_barbell_pull_to_chin,
                              lying_leg_flexion: new_lying_leg_flexion,
                              french_bench_press: new_french_bench_press)
    end

    def pump_batman_wednesday
      new_deadlift = current_batman_training.deadlift * 1.05
      new_pull_ups = current_batman_training.pull_ups * 1.05
      new_bent_over_barbell_pull = current_batman_training.bent_over_barbell_pull * 1.05
      new_vertical_pull_block = current_batman_training.vertical_pull_block * 1.05
      new_horizontal_pull_block = current_batman_training.horizontal_pull_block * 1.05
      new_barbell_forearm_curls = current_batman_training.barbell_forearm_curls * 1.05
      new_lifting_dumbbells_in_scott = current_batman_training.lifting_dumbbells_in_scott * 1.05
      new_incline_dumbbell_mahi = current_batman_training.incline_dumbbell_mahi * 1.05
      current_batman_training.update(deadlift: new_deadlift, pull_ups: new_pull_ups,
                              bent_over_barbell_pull: new_bent_over_barbell_pull,
                              vertical_pull_block: new_vertical_pull_block,
                              horizontal_pull_block: new_horizontal_pull_block,
                              barbell_forearm_curls: new_barbell_forearm_curls,
                              lifting_dumbbells_in_scott: new_lifting_dumbbells_in_scott,
                              incline_dumbbell_mahi: new_incline_dumbbell_mahi)
    end

    def pump_batman_friday
      new_seated_leg_extension = current_batman_training.seated_leg_extension * 1.05
      new_squats = current_batman_training.squats * 1.05
      new_leg_press = current_batman_training.leg_press * 1.05
      new_lunges = current_batman_training.lunges * 1.05
      new_lying_leg_flexion = current_batman_training.lying_leg_flexion * 1.05
      new_standing_calf_raises = current_batman_training.standing_calf_raises * 1.05
      current_batman_training.update(seated_leg_extension: new_seated_leg_extension, squats: new_squats,
                              leg_press: new_leg_press, lunges: new_lunges,
                              lying_leg_flexion: new_lying_leg_flexion,
                              standing_calf_raises: new_standing_calf_raises)
    end

    helper_method :current_batman_training
  end
end