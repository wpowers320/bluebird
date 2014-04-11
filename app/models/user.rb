class User < ActiveRecord::Base 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :confirmable, :timeoutable, :validatable and :activatable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable
        
  devise :omniauthable, :omniauth_providers => [:twitter]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :provider, :uid, :name, :screen_name, :image
  attr_accessible :remember_me
  
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create!(name:auth.info.name,
                          provider:auth.provider,
                          uid:auth.uid, 
                          screen_name:auth.info.nickname,
                          image:auth.info.image,
                          password:Devise.friendly_token[0,20]
                         )
    end
    user
  end

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.screen_name = auth["info"]["nickname"]
      user.image = auth["info"]["image"]
      user.home_timeline = auth["info"]["timeline"]
    end
  end

end
