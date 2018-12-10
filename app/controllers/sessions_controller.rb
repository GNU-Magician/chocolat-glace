class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "You have successfully logged in!"
      redirect_to user_path(@user)
    else
      flash[:danger] = "There's something wrong with your login information."
      render "new"

    end

  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have succesfully logged out."
    redirect_to posts_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end