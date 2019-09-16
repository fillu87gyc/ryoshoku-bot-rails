require File.expand_path(File.dirname(__FILE__) + '/environment')

# 実行環境を指定する
set :environment, Rails.env.to_sym
# 実行logの出力先
set :output, "#{Rails.root.to_s}/log/cron.log"

every 1.day, at: ['4:30 am', '7:00 am', '11:20 am', '5:20 pm'] do
  rake 'tweet:tweet'
end
