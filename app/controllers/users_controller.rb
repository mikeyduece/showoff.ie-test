class UsersController < ApplicationController
  before_action :require_user

  def show
    render file: '/public/404' unless current_user.nickname == params[:id]
  end
end
