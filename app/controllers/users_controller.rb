class UsersController < ApplicationController
  before_action :require_user

  def index

  end

  def show
    render file: '/public/404' unless current_user.id == params[:id].to_i
  end
end
