class SessionsController < ApplicationController
  def login
    user = User.all.find do |u|
      u.authenticate_login(params[:username_email], params[:password] )
    end
    if user
      session[:user_id] = user.id
      @current_user = user
      redirect_to user_path(@current_user)
    else
      session[:errors] = "Invalid login credentials"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
