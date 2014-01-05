require 'twitter'

user = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['LsuoMgEigHl6xodI7RDX4Q']
  config.consumer_secret = ENV['0b3pyuLChAJ8xFHk1aGUm0b8Kg4zn8MRA1vxUYl78']
  config.oauth_token = ENV['266264596-PyPeftHgzz5wjBu0TLMZf1oO8omCEjeOjzyh3u6R']
  config.oauth_token_secret = ENV['3cvvCAEh5F56dsc9kLVTdFwTnpxnrUfUcs47ft9H2FxDv']
end
