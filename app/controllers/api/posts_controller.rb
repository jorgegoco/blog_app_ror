class Api::PostsController < Api::ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @posts = @user.posts unless @user.nil?
    render json: @posts, status: :ok
  end
end