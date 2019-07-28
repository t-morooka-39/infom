class TweetsController < ApplicationController
  before_action :authenticate_member!, expect: [:index]
  def index
    @tweets = Tweet.all
  end
  def show
    @tweet = Tweet.find(params[:id])
  end
  def new
    @tweet = Tweet.new
  end
  def edit
  end
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.member_id = current_member.id 
    @tweet.save
    redirect_to tweets_url
  end
  def update
  end
  def delete
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title,:body)
  end
end
