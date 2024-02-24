module CountSpiderTraining
  extend ActiveSupport::Concern

  included do
    private

    def current_spider_training
      @user = User.find params[:user_id]
      @current_spider_training = @user.spiders.find params[:id]
    end

    def pump_count_update_training
      new_count_update_training = current_spider_training.count_update_training + 1
      current_spider_training.update(count_update_training: new_count_update_training)
    end

    def pump_monday_reps
      monday_reps = 8
      new_monday_reps = current_spider_training.monday_reps + 1
      if current_spider_training.monday_reps <= 9
        current_spider_training.update(monday_reps: new_monday_reps)
      else
        current_spider_training.update(monday_reps:)
      end
    end

    def pump_wednesday_reps
      wednesday_reps = 8
      new_wednesday_reps = current_spider_training.wednesday_reps + 1
      if current_spider_training.wednesday_reps <= 9
        current_spider_training.update(wednesday_reps: new_wednesday_reps)
      else
        current_spider_training.update(wednesday_reps:)
      end
    end

    def pump_friday_reps
      friday_reps = 8
      new_friday_reps = current_spider_training.friday_reps + 1
      if current_spider_training.friday_reps <= 9
        current_spider_training.update(friday_reps: new_friday_reps)
      else
        current_spider_training.update(friday_reps:)
      end
    end

    def pump_spider_monday
      new_barbell_bench_press = current_spider_training.barbell_bench_press * 1.05
      new_incline_press = current_spider_training.incline_press * 1.05
      new_push_ups_on_bars = current_spider_training.push_ups_on_bars * 1.05
      new_close_grip_bench_press = current_spider_training.close_grip_bench_press * 1.05
      new_seated_dumbbell_press = current_spider_training.seated_dumbbell_press * 1.05
      new_barbell_pull_to_chin = current_spider_training.barbell_pull_to_chin * 1.05
      current_spider_training.update(barbell_bench_press: new_barbell_bench_press,
                              incline_press: new_incline_press,
                              push_ups_on_bars: new_push_ups_on_bars,
                              close_grip_bench_press: new_close_grip_bench_press,
                              seated_dumbbell_press: new_seated_dumbbell_press,
                              barbell_pull_to_chin: new_barbell_pull_to_chin)
    end

    def pump_spider_wednesday
      new_deadlift = current_spider_training.deadlift * 1.05
      new_pull_ups = current_spider_training.pull_ups * 1.05
      new_incline_dumbbell_row = current_spider_training.incline_dumbbell_row * 1.05
      new_horizontal_pull_block = current_spider_training.horizontal_pull_block * 1.05
      new_barbell_forearm_curls = current_spider_training.barbell_forearm_curls * 1.05
      current_spider_training.update(deadlift: new_deadlift, pull_ups: new_pull_ups,
                                        incline_dumbbell_row: new_incline_dumbbell_row,
                                        horizontal_pull_block: new_horizontal_pull_block,
                                        barbell_forearm_curls: new_barbell_forearm_curls)
    end

    def pump_spider_friday
      new_squats = current_spider_training.squats * 1.05
      new_leg_press = current_spider_training.leg_press * 1.05
      new_romanian_deadlift = current_spider_training.romanian_deadlift * 1.05
      new_lunges = current_spider_training.lunges * 1.05
      new_standing_calf_raises = current_spider_training.standing_calf_raises * 1.05
      current_spider_training.update(squats: new_squats,
                              leg_press: new_leg_press, romanian_deadlift: new_romanian_deadlift,
                              lunges: new_lunges, standing_calf_raises: new_standing_calf_raises)
    end

    helper_method :current_spider_training
  end
end