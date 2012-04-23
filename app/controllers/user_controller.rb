class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to profile_path, :notice => 'Sign Up Successful'
      else
      render :new
    end
  end
end
