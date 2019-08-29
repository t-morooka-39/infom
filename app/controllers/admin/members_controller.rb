# frozen_string_literal: true

class Admin::MembersController < Admin::Base
  before_action :authenticate_member!
  def index
    @members = Member.without_soft_destroyed.all
    @delete_members = Member.only_soft_destroyed.all
  end

  def destroy
    @member = Member.without_soft_destroyed.find(params[:id])
    if @member.admin == true
      redirect_to %i[admin members], alert: '管理者は凍結できません'
    else
      @member.soft_destroy
      redirect_to :admin_members, notice: 'アカウントを凍結させました。'
    end
  end

  def cancel
    @member = Member.only_soft_destroyed.find(params[:id])
    @member.restore
    redirect_to :admin_members, notice: '凍結を解除しました。'
  end
end
