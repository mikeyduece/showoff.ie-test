class SessionsController < ApplicationController

  def new
  end

  def create
    require 'pry'; binding.pry
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def destroy
    require 'pry'; binding.pry
    session.clear
    redirect_to root_path
  end

end
