class SessionsController < ApplicationController
  def new 
    #just renders the new template, that's all
  end 
  
  
  def create 
    user = User.find_by(name: params[:user][:name])
    #find the user by the name key in the user hash, in the params hash
    
    user = user.try(:authenticate, params[:user][:name])
    #try to authenticate the user with this information in the params hash 
    #@user.try(:authenticate means if user != nil then user.authenticate, else, nil. End.
    
    return redirect_to(controller: 'sessions', action: 'new') unless user 
    
    session[:user_id] = user.id
    @user = user 
    redirect_to controller: 'welcome', action: 'home'
  end 
  
  def destroy 
    session.delete :user_id 
    redirect_to '/'
  end 
end
