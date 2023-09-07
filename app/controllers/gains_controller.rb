class GainsController < ApplicationController
  before_action :set_user
  before_action :set_gain, except: %i[new create]

  def new
    @gain = @user.gains.build
  end

  def create
    @gain = @user.gains.build gain_params
    if @gain.save
      flash[:success] = t('.success')
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @gain.update gain_params
      flash[:success] = t('.success')
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def update_gain
    case params[:complete_training]
    when 'monday'
      if current_gain_training.monday_reps <= 9
        pump_gain_reps_monday
      else
        pump_gain_reps_monday
        pump_gain_monday
      end
      flash[:success] = t('.success')
    when 'wednesday'
      if current_gain_training.wednesday_reps <= 9
        pump_gain_reps_wednesday
      else
        pump_gain_reps_wednesday
        pump_gain_wednesday
      end
      flash[:success] = t('.success')
    when 'friday'
      if current_gain_training.friday_reps <= 9
        pump_gain_reps_friday
      else
        pump_gain_reps_friday
        pump_gain_friday
      end
      pump_gain_count_update_training
      flash[:success] = t('.success')
    when 'crossfit_monday'
      pump_gain_crossfit_monday
      flash[:success] = t('.success')
    when 'crossfit_wednesday'
      pump_gain_crossfit_wednesday
      flash[:success] = t('.success')
    when 'crossfit_friday'
      pump_gain_crossfit_friday
      pump_gain_count_update_training
      flash[:success] = t('.success')
    when 'tabat_monday'
      if current_gain_training.monday_tabat_reps <= 40
        pump_gain_tabat_monday_reps
      else
        pump_gain_tabat_monday_reps
        pump_gain_tabat_monday
      end
      flash[:success] = t('.success')
    when 'tabat_wednesday'
      if current_gain_training.wednesday_tabat_reps <= 40
        pump_gain_tabat_wednesday_reps
      else
        pump_gain_tabat_wednesday_reps
        pump_gain_tabat_wednesday
      end
      flash[:success] = t('.success')
    when 'tabat_friday'
      if current_gain_training.friday_tabat_reps <= 40
        pump_gain_tabat_friday_reps
      else
        pump_gain_tabat_friday_reps
        pump_gain_tabat_friday
      end
      pump_gain_count_update_training
      flash[:success] = t('.success')
    when 'cyrcles_monday'
      pump_gain_cyrcles_monday
      flash[:success] = t('.success')
    when 'cyrcles_wednesday'
      pump_gain_cyrcles_wednesday
      flash[:success] = t('.success')
    when 'cyrcles_friday'
      pump_gain_cyrcles_friday
      pump_gain_count_update_training
      flash[:success] = t('.success')
    end
    redirect_to root_path
  end

  def show
  end

  def destroy
    @gain.destroy
    flash[:success] = t('.success')
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find params[:user_id]
  end

  def set_gain
    @gain = @user.gains.find params[:id]
  end

  def gain_params
    params.require(:gain).permit(:barbell_bench_press, :reverse_push_ups, :dumbbell_bench_press, :push_ups_on_bars,
                                 :stacked_chest_press, :extension_with_rope_handle, :dumbbell_abduction,
                                 :horizontal_pull_block, :pull_ups, :barbell_forearm_curls, :incline_dumbbell_row,
                                 :vertical_pull_block, :hyperextension, :hammers, :gack_squats, :seated_leg_extension,
                                 :leg_press, :hamer_shoulder_press, :dumbbells_through_the_side,
                                 :lying_leg_flexion, :pancake_swing_in_front_of_you, :barbell_pull_to_chin,
                                 :russian_twist, :bent_over_barbell_pull, :trapeze_in_smith,
                                 :lifting_dumbbells_in_scott, :biceps_sitting, :hull_reversals,
                                 :standing_dumbbell_french_press, :incline_dumbbell_mahi, :skating, :trusters,
                                 :kettlebell_swing, :front_squat, :hang_grab, :overhead_press,
                                 :kettlebell_pull_to_the_chin, :plank_with_kettlebell_pull, :deadlift,
                                 :dumbbell_layout, :forearm_curls_and_press_ups_with_a_barbell, :cross_over,
                                 :abduction_in_a_butterfly, :sumo_squats, :farm_walk)
  end
end