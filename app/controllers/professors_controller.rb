class ProfessorsController < ApplicationController
  expose :professor
  expose :professors do
    if params[:search].present?
      professors = SearchHelper.search(Professor, params[:search], "last_name")
    else
      professors = Professor.all
    end

    professors.paginate(page: params[:page], per_page: 9).order("created_at DESC")
  end

  expose :courses do
    Course.all
  end

  def create
    professor = Professor.new(professor_params)

    if professor.save
      ProfessorCourse.create_join_for_professor(params[:course], professor.id) if params[:course].present?
      flash[:success] = "Professor successfully created!"
      redirect_to professor_path(professor.id)
    else
      flash[:danger] = "Something went wrong..."
      render :new
    end
  end

  def edit
  end

  def update
    professor = Professor.find(params[:id])
    professor.update(professor_params)
    if professor.save
      flash[:success] = "Professor was updated successfully!"
      redirect_to professor_path(professor.id)
    else
      flash[:danger] = "Something went wrong..."
      render :edit
    end
  end

  private
  def professor_params
    params.require(:professor).permit(
      :first_name,
      :last_name,
      :title,
      :description,
      :filepicker_url,
      :rating
    )
  end
end
