class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.username}"
      redirect_to root_path
    else
      flash[:notice] = "There's something wrong with your username or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You logged out'
    redirect_to root_path
  end
end
