class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :signed_in? # these methods can be used in views

  def sign_in(user)
    session[:user_id] = user.id
  end

  def logout(user)
    session[:user_id] = nil
    redirect_to root_path
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id]) # same as @current_user = @current_user || User.find(...)
  end

  def signed_in?
    current_user
  end

  def require_user
    redirect_to login_path, flash: {error: 'Please log in first'} unless signed_in?
  end

  def redirect_to_homepage_if_signed_in
    redirect_to root_path if signed_in?
  end
end
