class TweetsController < ApplicationController
  before_action :authenticate_member!, only:[:show, :new, :edit, :create, :update, :destroy]
  def index
    @tweets = Tweet.order(created_at: :desc).page(params[:page]).per(10)
  end
  def show
    @tweet = Tweet.find(params[:id])
    @author = @tweet.author
  end
  def new
    @tweet = Tweet.new
  end
  def edit
  end
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.member_id = current_member.id 
    if @tweet.save
      redirect_to @tweet, notice: "投稿しました。"
    else 
      render :new
    end
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
