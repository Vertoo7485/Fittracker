# frozen_string_literal: true

class SpidersController < ApplicationController
  before_action :set_user
  before_action :set_spider, except: %i[new create]

  def show; end

  def new
    @spider = @user.spiders.build
  end

  def create
    @spider = @user.spiders.build spider_params
    if @spider.save
      flash[:success] = t('.success')
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update_spider
    case params[:complete_training]
    when 'fail'
      flash[:success] = t('.fail')
    when 'monday'
      if current_spider_training.monday_reps <= 9
        pump_monday_reps
      else
        pump_monday_reps
        pump_spider_monday
      end
      flash[:success] = t('.success')
    when 'wednesday'
      if current_spider_training.wednesday_reps <= 9
        pump_wednesday_reps
      else
        pump_wednesday_reps
        pump_spider_wednesday
      end
      flash[:success] = t('.success')
    when 'friday'
      if current_spider_training.friday_reps <= 9
        pump_friday_reps
      else
        pump_friday_reps
        pump_spider_friday
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

  def set_spider
    @spider = @user.spiders.find params[:id]
  end

  def spider_params
    params.require(:spider).permit(:barbell_bench_press, :incline_press, :push_ups_on_bars,
                                   :close_grip_bench_press, :seated_dumbbell_press, :barbell_pull_to_chin,
                                   :deadlift, :pull_ups, :incline_dumbbell_row, :horizontal_pull_block,
                                   :barbell_forearm_curls, :squats, :leg_press,
                                   :romanian_deadlift, :lunges, :standing_calf_raises, :sitap, :book)
  end
end