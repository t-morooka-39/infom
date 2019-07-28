class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all 
  end
  def show
  end
  def new
    @tweet = Tweet.new
  end
  def edit
  end
  def create
  end
  def update
  end
  def delete
  end
end
