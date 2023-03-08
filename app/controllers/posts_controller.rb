class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts unless @user.nil?
  end

  def show
    @post = Post.find_by_id(params[:id])
  end
end
