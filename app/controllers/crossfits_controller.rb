class CrossfitsController < ApplicationController
  before_action :set_user
  before_action :set_crossfit, except: %i[new create]

  def new
    @crossfit = @user.crossfits.build
  end

  def create
    @crossfit = @user.crossfits.build crossfit_params
    if @crossfit.save
      flash[:success] = "Crossfit training create"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @crossfit.update crossfit_params
      flash[:success] = "Crossfit training create"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def update_crossfit
    case params[:complete_training]
    when 'monday'
      pump_crossfit_monday
      flash[:success] = t('.success')
    when 'wednesday'
      pump_crossfit_wednesday
      flash[:success] = t('.success')
    when 'friday'
      pump_crossfit_friday
      pump_count_update_crossfit_training
      flash[:success] = t('.success')
    end
    redirect_to root_path
  end

  def show
  end

  def destroy
    @crossfit.destroy
    flash[:success] = "Crossfit training deleted"
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find params[:user_id]
  end

  def set_crossfit
    @crossfit = @user.crossfits.find params[:id]
  end

  def crossfit_params
    params.require(:crossfit).permit(:front_squat, :hang_grab, :overhead_press, :kettlebell_swing,
                                 :kettlebell_pull_to_the_chin, :russian_twist, :plank_with_kettlebell_pull,
                                 :trusters, :bent_over_barbell_pull, :deadlift, :mahi_dumbbells_through_the_sides,
                                 :dumbbell_layout, :barbell_pull_to_chin, :forearm_curls_and_press_ups_with_a_barbell,
                                 :cross_over, :abduction_in_a_butterfly, :lying_leg_flexion, :seated_leg_extension, 
                                 :sumo_squats, :farm_walk)
  end
end