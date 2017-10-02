class CommentsController < ApplicationController
  expose :comment
  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    discussion_id = params[:comment][:discussion_id]
    if comment.save
      flash[:success] = "Comment successfully created"
      redirect_to discussion_path(discussion_id)
    else
      flash[:danger] = "Something went wrong..."
      redirect_to discussion_path(discussion_id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(
      :body,
      :discussion_id
    )
  end
end
