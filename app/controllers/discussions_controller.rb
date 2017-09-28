class DiscussionsController < ApplicationController
  expose :discussion
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

  def update
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
