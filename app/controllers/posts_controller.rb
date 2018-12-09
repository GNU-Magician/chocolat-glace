class PostsController < ApplicationController
  def index
    @posts = Post.all

  end

  def show
    @post = Post.find(params[:id])

  end

  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)
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

  def post_params
    params.require(:post).permit(:title, :description)
  end

end
