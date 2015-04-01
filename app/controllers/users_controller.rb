class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]

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

  def edit; end

  def update

    if @user.update(user_params)
      flash[:notice] = "You profile has been updated"
      redirect_to root_path
    else
      flash[:error] = "There was a problem, please try again."
      render 'edit'
    end
  end

  private

  def set_user 
    @user = User.find_by(slug: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
