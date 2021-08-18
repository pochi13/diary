class TweetsController < ApplicationController
  before_action :find_tweet, only:[:show,:edit,:update,:destroy]
  def index
    @tweets = Tweet.order(created_at: :desc)
  end

  def show
    
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.sava
      redirect_to @tweet,notice: '作成できました'
    else
      render :new, alert: '作成できませんでした'
  end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet,notice: '更新できました'
    else
      render :edit, alert: '更新できませんでした'
    end
   end

  def destroy
    if @tweet.destroy
      redirect_to root_path, notice: '削除に成功しました'
    else
      redirect_to root_path, alert: '削除できませんでした'
   end
  end

  def search
  end


  private

  def find_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params

  end


end
