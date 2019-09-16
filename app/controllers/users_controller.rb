class UsersController < ApplicationController
  def index
  end

  def show
  end

  def tweet
    set_twitter_client
    tweet_value = 'めうめう！'
    @twitter.update(tweet_value)
    redirect_to users_index_path
  end

  private

  def set_twitter_client
    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials[:CONSUMER_KEY]
      config.consumer_secret     = Rails.application.credentials[:CONSUMER_SECRET]
      config.access_token        = Rails.application.credentials[:ACCESS_TOKEN]
      config.access_token_secret = Rails.application.credentials[:ACCESS_TOKEN_SECRET]
    end
  end
end
