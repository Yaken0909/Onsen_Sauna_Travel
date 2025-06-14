class Admin::PostImagesController < ApplicationController
  before_action :authenticate_user!  # Devise使ってるなら
  before_action :ensure_admin_user

  def index
    @post_images = PostImage.all
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to admin_post_images_path, notice: "削除しました"
  end

  private

  def ensure_admin_user
    unless current_user && current_user.admin?
      redirect_to root_path, alert: "管理者専用ページです"
    end
  end
end