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
  def favo
    @tweets = current_member.like_tweets.reverse_order.page(params[:page]).per(10)
    @page_title = "いいねしたツイート"
    render "other"
  end
  def followTweet
    if current_member.following&.present?
      @members = current_member.following
      @tweets = []
      @members.each do |member|
        @tweets += Tweet.where(member_id: member.id).reverse_order
      end
      @tweets = @tweets.sort_by{|tweet| tweet.created_at}.reverse
      @tweets = Kaminari.paginate_array(@tweets).page(params[:page]).per(10)
    end
  end
  def mine
    @tweets = current_member.tweets.reverse_order.page(params[:page]).per(10)
    @page_title = "あなたの投稿"
    render "other"
  end
  def search
    @tweets = []
    if params[:keyword] == ""
      @tweets = nil
      render "index"
    else
      @search_attr = params[:keyword]
      split_keyword = params[:keyword].split(/[[:blank:]]+/)
      split_keyword.each do |keyword|
        next if keyword == ""
        @tweets += Tweet.joins(:author).where("(body LIKE ?) OR (first_name LIKE ?)", "%#{keyword}%","%#{keyword}%")
      end
      @tweets.uniq!
      @tweets = Kaminari.paginate_array(@tweets).page(params[:page]).per(10)
    end
    render "index"
  end
  def rank
    @tweets = Tweet.find(Like.group(:tweet_id).order('count(tweet_id) desc').limit(20).pluck(:tweet_id))
  end
  private
  def tweet_params
    params.require(:tweet).permit(:title,:body)
  end
end
