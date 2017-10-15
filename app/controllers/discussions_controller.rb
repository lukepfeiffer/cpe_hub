class DiscussionsController < ApplicationController
  expose :discussion
  expose :new_comment do
    Comment.new
  end

  expose :comments do
    discussion.comments.where(comment_id: nil).order("created_at DESC")
  end

  expose :discussions do
    if params[:search].present?
      discussions = SearchHelper.search(Discussion, params[:search], "question")
    else
      discussions = Discussion.all
    end
  end

  expose :courses do
    Course.all
  end

  def create
    discussion = Discussion.new(discussion_params)
    discussion.user_id = current_user.id

    if discussion.save
      flash[:success] = "Discussion successfully created!"
      redirect_to discussion_path(discussion.id)
    else
      flash[:danger] = "Something went wrong..."
      render :new
    end
  end

  def edit
    unless valid_user
      flash[:danger] = "You do not have access!"
      redirect_to root_path
    end
  end

  def update
    discussion = Discussion.find(params[:id])
    if discussion.update(discussion_params)
      flash[:success] = "Discussion successfully updated!"
      redirect_to discussion_path(discussion.id)
    else
      flash[:danger] = "Something went wrong..."
      render :edit
    end
  end

  private
  def discussion_params
    params.require(:discussion).permit(
      :question,
      :course_id,
      :description,
      :admin_notes,
      :flag_count
    )
  end

  def valid_user
    if current_user.present?
      unless current_user.id == discussion.user_id || current_user.access_rights?(4)
        return true
      else
        return false
      end
    else
      return false
    end
  end
end
