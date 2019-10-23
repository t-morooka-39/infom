# frozen_string_literal: true

class Admin::BouncesController < Admin::Base
  before_action :authenticate_member!
  def index
    @bounces = Bounce.all
    @bounce = Bounce.new
  end

  def create
    @bounce = Bounce.new(bounce_params)
    add = @bounce.email
    if @bounce.save
      redirect_to %i[admin bounces], notice: "#{add}をブラックリストに追加しました。"
    else
      render :index
    end
  end

  def destroy
    @bounce = Bounce.find(params[:id])
    del = @bounce.email
    @bounce.destroy
    redirect_to %i[admin bounces], notice: "#{del}をブラックリストから解除しました。"
  end

  private

  def bounce_params
    params.require(:bounce).permit(:email)
  end
end
