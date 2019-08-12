class TweetImagesController < ApplicationController
  before_action :authenticate_member!
  before_action do 
    @tweet = Tweet.find(params[:tweet_id])
  end
  def index
    @images = TweetImage.order(created_at: :desc)
  end
  def show
  end
  def new
    @images = TweetImage.order(created_at: :desc)
    @image = TweetImage.new
  end
  def create 
    @image = @tweet.images.new(image_params)
    if @image.save
      redirect_to tweet_images_url(@tweet), notice: "画像を追加しました。"
    else
      render "new"
    end
  end
  def destroy
    @image = @tweet.images.find(params[:id])
    @image.destroy
    redirect_to tweet_images_url(@tweet), notice: "画像を削除しました。"
  end
  private
  def image_params
    params.require(:tweet_image).permit(
      :new_data,
      :alt_text
    )
  end
end