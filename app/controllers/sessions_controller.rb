class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(username: params[:username])
   
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      flash[:notice] = "Welcome back, #{user.username}!"
      redirect_to root_path
    else
      flash[:error] = "Invalid username or password."
      render 'new'
    end
  end

  def destroy
    cookies.delete :auth_token 
    cookies.delete :lat_long
    flash[:notice] = 'You have been logged out.'
    redirect_to root_path
  end
end
