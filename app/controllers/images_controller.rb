class ImagesController < ApplicationController
  before_action :set_tweet

  def create
    add_more_images(images_params[:images])
    flash[:error] = "画像のアップロードに失敗しました" unless @tweet.save
    redirect_to :back
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "画像のアップロードに失敗しました" unless @tweet.save
    redirect_to :back
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def add_more_images(new_images)
    images = @tweet.images 
    images += new_images
    @tweet.images = images
  end

  def remove_image_at_index(index)
     remain_images = @tweet.images
     if index == 0 && @tweet.images.size == 1
       @tweet.remove_images!
     else
       deleted_image = remain_images.delete_at(index) 
       deleted_image.try(:remove!)
       @tweet.images = remain_images
     end
  end

  def images_params
    params.require(:tweet).permit({images: []}) # allow nested params as array
  end
end