class UsersController < ApplicationController
  def index
    @users = User.order("created_at") #あとで管理者専用にする 
  end

  def show
    @user =User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    approval = [
      :nickname,
      :name,
      :admin,
      :email,
      :birthday,
      :sex
    ]
    
    params.require(:user).permit(approval)
  end
end
