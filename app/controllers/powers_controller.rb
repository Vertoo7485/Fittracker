class PowersController < ApplicationController
  before_action :set_user
  before_action :set_power, except: %i[new create]

  def new
    @power = @user.powers.build
  end

  def create
    @power = @user.powers.build power_params
    if @power.save
      flash[:success] = t('.success')
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @power.update power_params
      flash[:success] = t('.success')
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def update_power
    case params[:complete_training]
    when 'monday'
      if current_training.monday_reps <= 9
        pump_reps_monday
      else
        pump_reps_monday
        pump_power_monday
      end
      flash[:success] = t('.success')
    when 'wednesday'
      if current_training.wednesday_reps <= 9
        pump_reps_wednesday
      else
        pump_reps_wednesday
        pump_power_wednesday
      end
      flash[:success] = t('.success')
    when 'friday'
      if current_training.friday_reps <= 9
        pump_reps_friday
      else
        pump_reps_friday
        pump_power_friday
      end
      pump_count_update_training
      flash[:success] = t('.success')
    end
    redirect_to root_path
  end

  def show; end

  def destroy
    @power.destroy
    flash[:success] = t('.success')
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find params[:user_id]
  end

  def set_power
    @power = @user.powers.find params[:id]
  end

  def power_params
    params.require(:power).permit(:barbell_bench_press, :reverse_push_ups, :dumbbell_bench_press, :push_ups_on_bars,
                                  :stacked_chest_press, :extension_with_rope_handle, :dumbbell_abduction,
                                  :horizontal_pull_block, :pull_ups, :barbell_forearm_curls, :incline_dumbbell_row,
                                  :vertical_pull_block, :hyperextension, :hammers, :gack_squats, :seated_leg_extension,
                                  :leg_press, :hamer_shoulder_press, :dumbbells_through_the_side,
                                  :lying_leg_flexion, :pancake_swing_in_front_of_you, :barbell_pull_to_chin)
  end
end
