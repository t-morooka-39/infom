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
    @tweet = Tweet.find(params[:id])
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
    @tweet = Tweet.find(params[:id])
    @tweet.assign_attributes(tweet_params)
    @tweet.member_id = current_member.id
    if @tweet.save
      redirect_to @tweet, notice: "更新しました。"
    else
      render :edit
    end
  end
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to :tweets, notice: "ツイートを削除しました。"
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title,:body)
  end
end
