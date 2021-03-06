class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    projects_path
  end
  
  def after_sign_out_path_for(resource_or_scope) #return to page you logged out from
    request.referrer
  end

  def authenticate_admin_user! #override admin_user default to use user.is_admin
    redirect_to '/' unless current_user.is_admin? 
    authenticate_user! 
  end 

  def current_admin_user #override admin_user default to use user.is_admin
    return nil if user_signed_in? && !current_user.is_admin? 
    current_user 
  end 

end
