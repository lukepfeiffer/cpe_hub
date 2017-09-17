class CoursesController < ApplicationController
  expose :course
  expose :courses do
    if params[:type] == "tech_elective"
      Course.where(course_type: "Tech Elective")
    elsif params[:type] == "breadth_elective"
      Course.where(course_type: "Breadth Elective")
    elsif params[:type] == "core"
      Course.where(course_type: "Core")
    else
      Course.all
    end
  end
  expose :course_types do
    [
      "Core",
      "Tech Elective",
      "Breadth Elective"
    ]
  end

  def new
  end

  def create
    course = Course.new(course_params)
    course.desc_preview = Rails::Html::FullSanitizer.new.sanitize(course.description).truncate(100)

    if course.save
      flash[:success] = "Course successfully created!"
      redirect_to course_path(course.id)
    else
      flash[:danger] = "Something went wrong..."
      render :new
    end
  end


  def edit
  end

  def update
    course = Course.find(params[:id])
    course.update(desc_preview: Rails::Html::FullSanitizer.new.sanitize(course.description).truncate(100))
    if course.update(course_params)
      flash[:success] = "Course successfully updated!"
      redirect_to course_path(course.id)
    else
      flash[:danger] = "Something went wrong..."
      render :edit
    end
  end

  private

  def course_params
    params.require(:course).permit(
      :course_type,
      :name,
      :description,
      :course_code,
      :difficulty
    )
  end
end
