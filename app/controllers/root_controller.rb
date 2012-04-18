class RootController < ApplicationController
  def index
    if session[:skip_landing_page]
      redirect_to profile_path
    else
      render :action => 'homepage'
    end
    session[:skip_landing_page] = true
  end
end
