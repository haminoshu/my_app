class AvatarsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_avatar, only: [:edit, :destroy]

  def index
    @avatars = Avatar.all

    if user_signed_in?
      render :new
    end
  end

  def new
    @avatar = Avatar.new
  end

  def create
    @avatar = Avatar.new(avatar_params)

    if @avatar.save
      redirect_to root_path
    else
     render :new
    end
  end

  def show
    @avatar = Avatar.find(params[:id])
    @comment = Comment.new
    @comments = @avatar.comments.includes(:user)
  end

  def edit
    @avatar = Avatar.find(params[:id])

    unless current_user == @avatar.user
      redirect_to action: :index
    end
  end

  def update
    @avatar = Avatar.find(params[:id])

    if @avatar.update(avatar_params)
      redirect_to avatar_path
    else
      render :edit
    end
  end

  def destroy
    avatar = Avatar.find(params[:id])
    avatar.destroy
    redirect_to root_path

    unless user_signed_in?
      redirect_to action: :root_path
    end
  end

  private
  def avatar_params
    params.require(:avatar).permit(:nickname, :email, :password, :encrypted_password, :last_name, :first_name, :last_name_ruby, :first_name_ruby).merge(user_id: current_user.id)
  end

  def set_avatar
    @avatar = Avatar.find(params[:id])
  end

end
