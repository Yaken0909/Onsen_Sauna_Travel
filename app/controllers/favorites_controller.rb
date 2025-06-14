class FavoritesController < ApplicationController
    before_action :authenticate_user!
  
    def create
      post_image = PostImage.find(params[:post_image_id])
      favorite = current_user.favorites.new(post_image: post_image)
      favorite.save
      redirect_back fallback_location: post_images_path
    end
  
    def destroy
      post_image = PostImage.find(params[:post_image_id])
      favorite = current_user.favorites.find_by(post_image: post_image)
      favorite.destroy if favorite
      redirect_back fallback_location: post_images_path
    end
  end