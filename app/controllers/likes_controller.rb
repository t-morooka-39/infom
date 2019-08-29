# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_variable
  before_action :authenticate_member!
  def create
    unless @tweet.like?(current_member)
      like = current_member.likes.build(tweet_id: params[:tweet_id])
      like.save
      respond_to do |format|
        format.html { redirect_to tweets_path }
        format.js
      end
    end
  end

  def destroy
    if @tweet.like?(current_member)
      like = Like.find_by(tweet_id: @tweet.id, member_id: current_member.id)
      like.destroy
      respond_to do |format|
        format.html { redirect_to tweets_path }
        format.js
      end
    end
  end

  private

  def set_variable
    @tweet = Tweet.find(params[:tweet_id])
    @id = params[:tweet_id]
  end
end
