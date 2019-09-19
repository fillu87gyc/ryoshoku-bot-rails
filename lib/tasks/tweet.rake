namespace :tweet do
  task :tweet => :environment do
    set_twitter_client
    menu = Menu.find_by(date: Date.today.to_s, time: set_time)
    if menu == nil
      tweet_value = 'まだデータが内容です...('+ Date.today.to_s +')'+set_time
    else
      tweet_value = menu.menu1 + 'と' + menu.menu2 + 'です'
      @twitter.update(tweet_value)
    end
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

def set_time
  h = Time.now.hour
  if (h<8)
    eat_time = 1
  elsif (h<14)
    eat_time = 2
  else
    eat_time = 3
  end
  eat_time
end
