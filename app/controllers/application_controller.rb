class ApplicationController < ActionController::Base
  protect_from_forgery

  def fullpath
    request.fullpath
  end
  helper_method :fullpath

  private
end
