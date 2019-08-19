class MembersController < ApplicationController
  before_action :authenticate_member!, only:[:show,:following, :followers]
  # 管理者用にする
  def index
    @members = Member.without_soft_destroyed.all
    @delete_members = Member.only_soft_destroyed.all
  end
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
  def destroy 
    @member = Member.without_soft_destroyed.find(params[:id])
    @member.soft_destroy
    redirect_to :members, notice: "アカウントを凍結させました。"
  end
  def cancel
    @member = Member.only_soft_destroyed.find(params[:id])
    @member.restore
    redirect_to :members, notice: "凍結を解除しました。"
  end
end
