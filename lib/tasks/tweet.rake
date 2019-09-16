namespace :tweet do
  desc 'random_tweet'
  task :tweet do
    set_twitter_client
    tweet_value = rand.to_s + 'てすとです'
    @twitter.update(tweet_value)
  end
end

def set_twitter_client
  @twitter = Twitter::REST::Client.new do |config|
    config.consumer_key        = Rails.application.credentials[:CONSUMER_KEY]
    config.consumer_secret     = Rails.application.credentials[:CONSUMER_SECRET]
    config.access_token        = Rails.application.credentials[:ACCESS_TOKEN]
    config.access_token_secret = Rails.application.credentials[:ACCESS_TOKEN_SECRET]
  end
end
