class UserController < ApplicationController

  before_filter :authenticate_user!

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to home_path, :notice => 'Sign Up Successful'
      else
      render :new
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.screen_name = auth["info"]{"nickname"}
      user.image = auth["info"]["image"]
    end
  end
end
