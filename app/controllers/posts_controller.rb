class PostsController < ApplicationController
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:update, :edit, :destroy]
  def index
    @posts = Post.all

  end

  def show
    @post = Post.find(params[:id])

  end

  def new
    @topics = Topic.all
    @post = Post.new

  end

  def create
    @topics = Topic.all
    @post = Post.new(post_params)
    @post.user = User.find(session[:user_id]) if session[:user_id]

    if @post.save
      flash[:success] = "Post was made successfully!"
      redirect_to posts_path
    else
      render "new"
    end

  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to posts_path
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "You succesfully deleted the post."
    redirect_to posts_path
  end


  private


  def post_params
    params.require(:post).permit(:title, :description, :topic_id)
  end

  def require_same_user
    if current_user != @post.user
      flash[:danger] = "You can only change your own post"
      redirect_to posts_path

    end

  end



end
