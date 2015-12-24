class SessionsController < ApplicationController
  before_action :require_user, only: [:destroy]
  before_action :redirect_to_homepage_if_signed_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to root_path, flash: {success: "Welcome back <strong>#{current_user.name}</strong>!"}
    else
      redirect_to login_path, flash: {error: 'Email or password is incorrect'}
    end
  end

  def destroy
    logout(current_user)
  end
end
