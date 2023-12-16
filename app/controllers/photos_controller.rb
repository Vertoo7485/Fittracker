class PhotosController < ApplicationController
  before_action :set_user

  def index
    @pagy, @photos = pagy @user.photos.includes(images_attachments: :blob).order(created_at: :desc), items: 2
  end
  
  def new
    @photo = @user.photos.build
  end

  def create
    @photo = @user.photos.build(photo_params)
    if @photo.save
      flash[:success] = t('.success')
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find params[:user_id]
  end

  def photo_params
    params.require(:photo).permit(:title, :date, images: [])
  end
end