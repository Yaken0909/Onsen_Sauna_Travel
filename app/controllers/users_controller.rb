class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールを更新しました。"
    else
      render :edit
    end
  end

  before_action :authenticate_user!
before_action :correct_user, only: [:edit, :update]

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path, alert: "不正なアクセスです。" unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end