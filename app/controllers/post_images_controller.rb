class PostImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post_image = PostImage.new
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path, notice: '投稿が完了しました'
    else
      render :new
    end
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      redirect_to post_image_path(@post_image), notice: "投稿を更新しました"
    else
      render :edit
    end
  end


  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @user = @post_image.user  
  end

  def destroy
    p @post_image = PostImage.find(params[:id])
    puts "=== 削除対象ID: #{@post_image.id} ==="
    @post_image.image.purge if @post_image.image.attached?
    @post_image.destroy
    redirect_to post_images_path, notice: '投稿を削除しました'
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image, :facilities_name, :caption)
  end

  def correct_user
    @post_image = PostImage.find(params[:id])
    redirect_to post_images_path, alert: "操作が不正です" unless @post_image.user == current_user
  end
end