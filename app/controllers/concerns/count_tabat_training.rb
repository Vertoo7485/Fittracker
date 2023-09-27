# frozen_string_literal: true

module CountTabatTraining
  extend ActiveSupport::Concern

  included do
    private

    def current_tabat_training
      @user = User.find params[:user_id]
      @current_tabat_training = @user.tabats.find params[:id]
    end

    def pump_count_update_tabat_training
      new_count_update = current_tabat_training.count_update_training + 1
      current_tabat_training.update(count_update_training: new_count_update)
    end

    def pump_tabat_monday_reps
      monday_reps = 30
      new_monday_sets = 5
      new_monday_reps = current_tabat_training.monday_reps + 5
      if current_tabat_training.monday_reps <= 40
        current_tabat_training.update(monday_reps: new_monday_reps)
      else
        current_tabat_training.update(monday_sets: new_monday_sets)
      end
    end

    def pump_tabat_wednesday_reps
      wednesday_reps = 30
      new_wednesday_sets = 5
      new_wednesday_reps = current_tabat_training.wednesday_reps + 5
      if current_tabat_training.wednesday_reps <= 40
        current_tabat_training.update(wednesday_reps: new_wednesday_reps)
      else
        current_tabat_training.update(wednesday_sets: new_wednesday_sets)
      end
    end

    def pump_tabat_friday_reps
      friday_reps = 30
      new_friday_sets = 5
      new_friday_reps = current_tabat_training.friday_reps + 5
      if current_tabat_training.friday_reps <= 40
        current_tabat_training.update(friday_reps: new_friday_reps)
      else
        current_tabat_training.update(friday_sets: new_friday_sets)
      end
    end

    def pump_tabat_monday
      new_mahi_dumbbells_through_the_sides = current_tabat_training.mahi_dumbbells_through_the_sides * 1.05
      new_incline_dumbbell_mahi = current_tabat_training.incline_dumbbell_mahi * 1.05
      current_tabat_training.update(mahi_dumbbells_through_the_sides: new_mahi_dumbbells_through_the_sides,
                                    incline_dumbbell_mahi: new_incline_dumbbell_mahi)
    end

    def pump_tabat_wednesday
      new_trusters = current_tabat_training.trusters * 1.05
      new_kettlebell_swing = current_tabat_training.kettlebell_swing * 1.05
      current_tabat_training.update(trusters: new_trusters, kettlebell_swing: new_kettlebell_swing)
    end

    def pump_tabat_friday
      new_barbell_forearm_curl = current_tabat_training.barbell_forearm_curl * 1.05
      current_tabat_training.update(barbell_forearm_curl: new_barbell_forearm_curl)
    end

    helper_method :current_tabat_training
  end
end
