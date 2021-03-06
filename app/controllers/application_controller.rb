class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_user

  helper_method :require_user,
    :current_user,
    :current_user_bio,
    :posts,
    :follows,
    :followed_by,
    :website

  def require_user
    unless current_user || (current_user.present? && current_user.id == params[:id])
      flash[:notice] = "You Must Log in or Register to View this Page"
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] && User.exists?(id: session[:user_id])
  end

  def current_user_bio
    JSON.parse(current_user.bio) if current_user
  end

  def posts
    current_user.user_media[:data][:counts][:media]
  end

  def follows
    current_user.user_media[:data][:counts][:follows]
  end

  def followed_by
    current_user.user_media[:data][:counts][:followed_by]
  end

  def website
    current_user.user_media[:data][:website]
  end
end
