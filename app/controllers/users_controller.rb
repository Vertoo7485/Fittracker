# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: %i[edit update]
  before_action :set_user!, only: %i[edit update show]
  before_action :authorize_user!

  def show
    @batman = @user.batmen.build
    @batmen = @user.batmen.order created_at: :desc
    @power = @user.powers.build
    @powers = @user.powers.order created_at: :desc
    @crossfit = @user.crossfits.build
    @crossfits = @user.crossfits.order created_at: :desc
    @gain = @user.gains.build
    @gains = @user.gains.order created_at: :desc
    @wolverine = @user.wolverines.build
    @wolverines = @user.wolverines.order created_at: :desc
    @spider = @user.spiders.build
    @spiders = @user.spiders.order created_at: :desc
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      flash[:success] = t('.success', name: current_user.name_or_email)
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @user.update user_params
      flash[:success] = t('.success')
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user!
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :old_password, :weight, :growth,
                                 :years, :gender, :avatar)
  end

  def authorize_user!
    authorize(@user || User)
  end
end
