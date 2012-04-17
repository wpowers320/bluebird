class RootController < ApplicationController
  def index
    render :action => 'homepage'
  end
end
