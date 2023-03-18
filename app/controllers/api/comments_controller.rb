class API::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.author = current_user
    render json: @comment, status: :created
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
