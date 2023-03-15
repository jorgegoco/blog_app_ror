class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts unless @user.nil?
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.includes(:comments).find_by_id(params[:id]) unless @user.nil?
    @comments = @post.comments.includes(:author) unless @post.nil?
  end 

  def create
    @post = Post.new(strong_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    @post.author = current_user
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.find_by_id(params[:id]) 
    @post.destroy
    redirect_to user_posts_path(current_user)
  end

  private

  def strong_params
    params.require(:post).permit(:title, :text)
  end
end
