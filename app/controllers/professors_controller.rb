class ProfessorsController < ApplicationController
  expose :professor
  expose :professors do
    Professor.all
  end
  expose :courses do
    Course.all
  end

  def create
    professor = Professor.new(professor_params)

    if professor.save
      ProfessorCourse.create_join_for_professor(params[:course], professor.id)
      flash[:danger] = "Professor successfully created!"
      redirect_to professor_path(professor.id)
    else
      flash[:danger] = "Something went wrong..."
      render :new
    end
  end

  private
  def professor_params
    params.require(:professor).permit(
      :first_name,
      :last_name,
      :title,
      :description
    )
  end
end
