class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts unless @user.nil?
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @post = Post.find_by_id(params[:id]) unless @user.nil?
    @comments = @post.comments unless @post.nil?
  end
end
