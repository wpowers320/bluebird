class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :tweet_id
      t.string :screen_name
      t.text :favorites

      t.timestamps
    end
  end
end
