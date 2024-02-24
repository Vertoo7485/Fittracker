# frozen_string_literal: true

class WolverinesController < ApplicationController
  before_action :set_user
  before_action :set_wolverine, except: %i[new create]

  def show; end

  def new
    @wolverine = @user.wolverines.build
  end

  def create
    @wolverine = @user.wolverines.build wolverine_params
    if @wolverine.save
      flash[:success] = t('.success')
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update_wolverine
    case params[:complete_training]
    when 'fail'
      flash[:success] = t('.fail')
    when 'monday'
      if current_wolverine_training.monday_reps <= 9
        pump_monday_reps
      else
        pump_monday_reps
        pump_wolverine_monday
      end
      flash[:success] = t('.success')
    when 'wednesday'
      if current_wolverine_training.wednesday_reps <= 9
        pump_wednesday_reps
      else
        pump_wednesday_reps
        pump_wolverine_wednesday
      end
      flash[:success] = t('.success')
    when 'friday'
      if current_wolverine_training.friday_reps <= 9
        pump_friday_reps
      else
        pump_friday_reps
        pump_wolverine_friday
      end
      pump_count_update_training
      flash[:success] = t('.success')
    end
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find params[:user_id]
  end

  def set_wolverine
    @wolverine = @user.wolverines.find params[:id]
  end

  def wolverine_params
    params.require(:wolverine).permit(:barbell_bench_press, :dumbbell_bench_press, :push_ups_on_bars,
                                   :seated_dumbbell_press, :barbell_pull_to_chin, :french_bench_press,
                                   :pull_ups, :incline_dumbbell_row, :vertical_pull_block, :bent_over_barbell_pull,
                                   :hyperextension, :barbell_forearm_curls, :incline_dumbbell_mahi,
                                   :seated_leg_extension, :squats, :deadlift, :leg_press, :lying_leg_flexion,
                                   :standing_calf_raises, :sitap, :hanging_leg_raise)
  end
end