# frozen_string_literal: true

class TabatsController < ApplicationController
  before_action :set_user
  before_action :set_tabat, except: %i[new create]

  def show; end

  def new
    @tabat = @user.tabats.build
  end

  def edit; end

  def create
    @tabat = @user.tabats.build tabat_params
    if @tabat.save
      redirect_to user_path(@user)
      flash.now[:success] = t('.success')
    else
      render :new
    end
  end

  def update
    if @tabat.update tabat_params
      redirect_to user_path(@user)
      flash.now[:success] = t('.success')
    else
      render :edit
    end
  end

  def update_tabat
    case params[:complete_training]
    when 'monday'
      if current_tabat_training.monday_reps <= 40
        pump_tabat_monday_reps
      else
        pump_tabat_monday_reps
        pump_tabat_monday
      end
      flash[:success] = t('.success')
    when 'wednesday'
      if current_tabat_training.wednesday_reps <= 40
        pump_tabat_wednesday_reps
      else
        pump_tabat_wednesday_reps
        pump_tabat_wednesday
      end
      flash[:success] = t('.success')
    when 'friday'
      if current_tabat_training.friday_reps <= 40
        pump_tabat_friday_reps
      else
        pump_tabat_friday_reps
        pump_tabat_friday
      end
      pump_count_update_training
      flash[:success] = t('.success')
    end
    redirect_to root_path
  end

  def destroy
    @tabat.destroy
    redirect_to user_path(@user)
    flash.now[:success] = t('.success')
  end

  private

  def set_user
    @user = User.find params[:user_id]
  end

  def set_tabat
    @tabat = @user.tabats.find params[:id]
  end

  def tabat_params
    params.require(:tabat).permit(:mahi_dumbbells_through_the_sides, :incline_dumbbell_mahi, :trusters,
                                  :kettlebell_swing, :barbell_forearm_curl)
  end
end
