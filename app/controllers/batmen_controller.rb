# frozen_string_literal: true

class BatmenController < ApplicationController
  before_action :set_user
  before_action :set_batman, except: %i[new create]

  def show; end

  def new
    @batman = @user.batmen.build
  end

  def create
    @batman = @user.batmen.build batman_params
    if @batman.save
      flash[:success] = t('.success')
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update_batman
    case params[:complete_training]
    when 'fail'
      flash[:success] = t('.fail')
    when 'monday'
      if current_batman_training.monday_reps <= 9
        pump_monday_reps
      else
        pump_monday_reps
        pump_batman_monday
      end
      flash[:success] = t('.success')
    when 'wednesday'
      if current_batman_training.wednesday_reps <= 9
        pump_wednesday_reps
      else
        pump_wednesday_reps
        pump_batman_wednesday
      end
      flash[:success] = t('.success')
    when 'friday'
      if current_batman_training.friday_reps <= 9
        pump_friday_reps
      else
        pump_friday_reps
        pump_batman_friday
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

  def set_batman
    @batman = @user.batmen.find params[:id]
  end

  def batman_params
    params.require(:batman).permit(:barbell_bench_press, :incline_dumbbell_press, :push_ups_on_bars,
                                   :overhead_press, :barbell_pull_to_chin, :dumbbells_through_the_side,
                                   :french_bench_press, :deadlift, :pull_ups, :bent_over_barbell_pull,
                                   :vertical_pull_block, :horizontal_pull_block, :barbell_forearm_curls,
                                   :lifting_dumbbells_in_scott, :incline_dumbbell_mahi, :seated_leg_extension,
                                   :squats, :leg_press, :lunges, :lying_leg_flexion, :standing_calf_raises,
                                   :sitap, :book)
  end
end