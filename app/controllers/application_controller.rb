class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user 
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end 
  
  def logged_in?
    current_user.id != nil 
    #return true if the current user's id from the db is not nil 
  end 
  
  def require_logged_in 
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end 
  #show them the new page unless they're logged in 
end
