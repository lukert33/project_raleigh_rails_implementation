class UsersController < ApplicationController

  def index
    if current_user
      redirect_to user_path(current_user)
    else
      render "index"
    end
  end

  def new
    @current_user = User.new
  end

  def create
    @current_user = User.new(user_params)
    if @current_user.save
      session[:user_id] = @current_user.id
      redirect_to user_path(@current_user)
    else
      render :new
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end

end
