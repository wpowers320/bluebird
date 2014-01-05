class Favorites < ActiveRecord::Base
  attr_accessible :favorites, :screen_name, :tweet_id
  
  def self.pull_tweets
    Twitter.favorites("wpowersiv", since_id: maximum(:tweet_id)).each do |tweet|
      unless exists?(tweet_id: tweet.id)
        create!(
          tweet_id: tweet_id,
          favorites: tweet.favorites,
          screen_name: tweet.user.screen_name,
        )
      end
    end
  end
end
