class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.three_recent_posts unless @user.nil?
  end
end
