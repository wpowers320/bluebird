module ProfileHelper

  def profile_page?
    params[:controller] == 'profile'  
  end
end
