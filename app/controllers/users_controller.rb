class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.admin = false

    if @user.save
      flash[:notice] = "Hello #{@user.username}! Your profile has been created"
      redirect_to root_path
    else
      flash[:error] = "There was a problem, please try again."
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
