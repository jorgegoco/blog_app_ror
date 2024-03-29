class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comment = Comment.new(strong_params)
    @comment.post = @post
    @comment.author = current_user
    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @user = @post.author
    @comment.destroy
    @post.decrement!(:comments_counter)
    redirect_to user_post_path(@user, @post)
  end

  private

  def strong_params
    params.require(:comment).permit(:text)
  end
end
