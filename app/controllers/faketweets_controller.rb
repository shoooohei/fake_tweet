class FaketweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]

  def index
    @alltweet = Faketweet.order(created_at: :desc)
    # @faketweet =
  end

  def new
    @faketweet = Faketweet.new
  end

  def create
     @faketweet = Faketweet.new(tweet_params)
     if @faketweet.save
      redirect_to faketweets_path, notice: "新しくつぶやきました"
     else
      @alltweet = Faketweet.order(created_at: :desc)
      render "index"
     end
  end

  def edit
  end

  def update
    if @faketweet.update(tweet_params)
      redirect_to faketweets_path, notice: "更新できました"
    else
      render "edit"
    end
  end

  def destroy
    @faketweet.destroy
    redirect_to faketweets_path, notice: "削除できました"
  end


  private
  def tweet_params
    params.require(:faketweet).permit(:content)
  end

  def set_tweet
    @faketweet = Faketweet.find(params[:id])
  end
end
