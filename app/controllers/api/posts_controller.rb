class Api::PostsController < Api::ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts unless @user.nil?
    render json: @posts
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.includes(:comments).find_by_id(params[:id]) unless @user.nil?
    @comments = @post.comments.includes(:author) unless @post.nil?
    render json: @comments
  end
end
