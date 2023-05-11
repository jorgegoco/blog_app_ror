class LikesController < ApplicationController
  def create
    @like = Like.new
    existing_like = Like.find_by(author_id: current_user.id, post_id: params[:post_id])

    if existing_like
      head :no_content # we are returning a HTTP 204 (No Content) response
    else
      @like.author = current_user
      @like.post = Post.find(params[:post_id])
      if @like.save
        redirect_to user_post_path(@like.post.author, @like.post)
      else
        render :new
      end
    end
  end
end
