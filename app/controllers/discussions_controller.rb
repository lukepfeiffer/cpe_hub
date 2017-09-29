class DiscussionsController < ApplicationController
  expose :discussion
  expose :new_comment do
    Comment.new
  end

  expose :discussions do
    Discussion.all
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
end
