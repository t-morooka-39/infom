class MembersController < ApplicationController
  # 管理者用にする
  def index
    @members = Member.order("created_at")
  end

  def show
    # @member = Member.find(paramsid)
    @member = current_member.id
  end
end
