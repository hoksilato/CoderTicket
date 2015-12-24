class UsersController < ApplicationController
  before_action :redirect_to_homepage_if_signed_in, only: [:new, :create]

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to root_path, flash: {success: "Welcome <strong>#{current_user.name}</strong>!"}
    else
      render :new
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
