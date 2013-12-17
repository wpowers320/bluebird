class RootController < ApplicationController

  def index
    if user_signed_in? 
      redirect_to home_path
    else
      render :action => 'homepage'
    end 
  end
end


