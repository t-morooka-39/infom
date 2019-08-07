class LikesController < ApplicationController
  before_action :set_variable
  def create
    like = current_member.likes.build(tweet_id: params[:tweet_id])
    like.save
    respond_to do |format|
      format.html{ redirect_to tweets_path}
      format.js
    end
 end

 def destroy
    like = Like.find_by(tweet_id: @tweet.id, member_id: current_member.id)
    like.destroy
    respond_to do |format|
      format.html{ redirect_to tweets_path}
      format.js
    end
 end
 private
 def set_variable
  @tweet = Tweet.find(params[:tweet_id])
  @id_name = "#{@tweet.id}"
 end
end