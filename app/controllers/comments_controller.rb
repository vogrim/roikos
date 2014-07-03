class CommentsController < ApplicationController

  def create
    @comment = Comment.new comment_params

    @comment.user = current_user

    if @comment.save

      @new_comment = @comment.commentable.comments.new

      render "success"
    else
      render "error"
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end

end