class MembersController < ApplicationController
  # 管理者用にする
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
    @tweets = @member.tweets
    # @member = current_member.id
  end
  def new
  end
  def edit
  end
  def create
  end
  def update
  end
  def destroy
  end
end
