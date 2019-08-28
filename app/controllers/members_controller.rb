class MembersController < ApplicationController
  before_action :authenticate_member!
  # 管理者用にする
  def show
    @member = Member.find(params[:id])
    @tweets = @member.tweets
    # @member = current_member.id
  end
  def favtweets
    @favorite_tweets = current_member.favorite_tweets
  end
  def following
    @page_title = "フォロー中"
    @member = Member.find(params[:id])
    @members = @member.following.page(params[:page]).per(10)
    render "show_follow"
  end
  def followers
    @page_title = "フォロワー"
    @member = Member.find(params[:id])
    @members = @member.followers.page(params[:page]).per(10)
    render "show_follow"
  end
end
