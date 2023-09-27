# frozen_string_literal: true

module CountCrossfitTraining
  extend ActiveSupport::Concern

  included do
    private

    def current_crossfit_training
      @user = User.find params[:user_id]
      @current_crossfit_training = @user.crossfits.find params[:id]
    end

    def pump_count_update_crossfit_training
      new_count_update = current_crossfit_training.count_update_training + 1
      current_crossfit_training.update(count_update_training: new_count_update)
    end

    def pump_crossfit_monday
      new_front_squat = current_crossfit_training.front_squat * 1.05
      new_hang_grab = current_crossfit_training.hang_grab * 1.05
      new_overhead_press = current_crossfit_training.overhead_press * 1.05
      new_kettlebell_swing = current_crossfit_training.kettlebell_swing * 1.05
      new_kettlebell_pull_to_the_chin = current_crossfit_training.kettlebell_pull_to_the_chin * 1.05
      new_russian_twist = current_crossfit_training.russian_twist * 1.05
      new_plank_with_kettlebell_pull = current_crossfit_training.plank_with_kettlebell_pull * 1.05
      current_crossfit_training.update(front_squat: new_front_squat, hang_grab: new_hang_grab,
                                       overhead_press: new_overhead_press, kettlebell_swing: new_kettlebell_swing,
                                       kettlebell_pull_to_the_chin: new_kettlebell_pull_to_the_chin,
                                       russian_twist: new_russian_twist,
                                       plank_with_kettlebell_pull: new_plank_with_kettlebell_pull)
    end

    def pump_crossfit_wednesday
      new_trusters = current_crossfit_training.trusters * 1.05
      new_bent_over_barbell_pull = current_crossfit_training.bent_over_barbell_pull * 1.05
      new_deadlift = current_crossfit_training.deadlift * 1.05
      new_mahi_dumbbells_through_the_sides = current_crossfit_training.mahi_dumbbells_through_the_sides * 1.05
      new_dumbbell_layout = current_crossfit_training.dumbbell_layout * 1.05
      new_barbell_pull_to_chin = current_crossfit_training.barbell_pull_to_chin * 1.05
      current_crossfit_training.update(trusters: new_trusters, bent_over_barbell_pull: new_bent_over_barbell_pull,
                                       deadlift: new_deadlift,
                                       mahi_dumbbells_through_the_sides: new_mahi_dumbbells_through_the_sides,
                                       dumbbell_layout: new_dumbbell_layout, barbell_pull_to_chin: new_barbell_pull_to_chin)
    end

    def pump_crossfit_friday
      new_forearm_curls_and_press_ups_with_a_barbell = current_crossfit_training.forearm_curls_and_press_ups_with_a_barbell * 1.05
      new_cross_over = current_crossfit_training.cross_over * 1.05
      new_abduction_in_a_butterfly = current_crossfit_training.abduction_in_a_butterfly * 1.05
      new_lying_leg_flexion = current_crossfit_training.lying_leg_flexion * 1.05
      new_seated_leg_extension = current_crossfit_training.seated_leg_extension * 1.05
      new_sumo_squats = current_crossfit_training.sumo_squats * 1.05
      new_farm_walk = current_crossfit_training.farm_walk * 1.05
      current_crossfit_training.update(forearm_curls_and_press_ups_with_a_barbell: new_forearm_curls_and_press_ups_with_a_barbell,
                                       cross_over: new_cross_over, abduction_in_a_butterfly: new_abduction_in_a_butterfly,
                                       lying_leg_flexion: new_lying_leg_flexion, seated_leg_extension: new_seated_leg_extension,
                                       sumo_squats: new_sumo_squats, farm_walk: new_farm_walk)
    end

    helper_method :current_crossfit_training
  end
end
