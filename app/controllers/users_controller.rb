class UsersController < ApplicationController

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created successfully!"
      redirect_to user_path(@user)
    else
      render 'users/new'
    end

  end

  def destroy
    @user = User.find(params[:id])
    if session[:user_id] == @user
      session[:user_id] = nil
    end
    if @user.destroy
      flash[:success] = "User has been deleted"
      redirect_to posts_path
    else
      flash[:danger] = "We couldn't find the user."
      render user_path(@user)
    end

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
