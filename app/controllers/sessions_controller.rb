class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have succesfully logged in"
      redirect_to users_path(user)
    else
      flash.now[:alert] = "Username or password is invalid"
      render "new"
    end
  end

    def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You have logged out!"
    end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end
end
