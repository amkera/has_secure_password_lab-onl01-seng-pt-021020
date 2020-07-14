class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    #find this user by the name key in the user hash, in the params hash 
    #byebug
    #params: 
      #<ActionController::Parameters {"user"=><ActionController::Parameters {"name"=>"Connie", "password"=>"M4heswaran"} permitted: false>, "controller"=>"sessions", "action"=>"create"} permitted: false>
      
    user = user.try(:authenticate, params[:user][:password])

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