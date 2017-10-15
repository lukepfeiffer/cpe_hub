class CoursesController < ApplicationController
  expose :course
  expose :courses do
    SearchHelper.search(Course, params[:search], "name")
  end

  expose :course_letters do
    if params[:type] == "tech_elective"
      letters = Course.course_code_letters("Tech Elective")
    elsif params[:type] == "breadth_elective"
      letters = Course.course_code_letters("Breadth Elective")
    elsif params[:type] == "core"
      letters = Course.course_code_letters("Core")
    else
      letters = Course.all
    end

    letters.uniq.sort_by(&:downcase)
  end

  expose :array_of_arrays do
    if params[:type] == "tech_elective"
      Course.filter_by_code("Tech Elective")
    elsif params[:type] == "breadth_elective"
      Course.filter_by_code("Breadth Elective")
    elsif params[:type] == "core"
      Course.filter_by_code("Core")
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
    course.desc_preview = Rails::Html::FullSanitizer.new.sanitize(course.description).truncate(80)

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
    course.update(desc_preview: Rails::Html::FullSanitizer.new.sanitize(course.description).truncate(80))
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
