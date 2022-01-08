class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: %i[new create]

  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user_authentication(user)
      session_assignment(user)
    else
      flash.now[:error] = 'There was something wrong with your login data.'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have successfully logged out.'
    redirect_to login_path
  end

  private

  def logged_in_redirect
    return unless logged_in?

    flash[:error] = 'You are already logged in.'
    redirect_to root_path
  end

  def user_authentication(user)
    user.authenticate(params[:session][:password])
  end

  def session_assignment(user)
    session[:user_id] = user.id
    flash[:success] = 'You have successfully logged in.'
    redirect_to root_path
  end
end
