class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to users_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
