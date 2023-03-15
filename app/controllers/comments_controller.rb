class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(strong_params)
    @comment.post = @post
    @comment.author = current_user
    if @comment.save
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    @comment.destroy
    redirect_to user_post_path(current_user, params[:post_id])
  end

  private

  def strong_params
    params.require(:comment).permit(:text)
  end
end
