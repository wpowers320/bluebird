class VideoController < ApplicationController

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(params[:video])
    @video.user = current_user
    if @video.save
      flash[:notice] = 'Video Uploaded'
      redirect_to :controller => 'profile', :action => 'profile'
      else 
        render :new
    end
  end
end