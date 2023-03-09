class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.post = @post
    @comment.author = current_user
    if @comment.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end
end
