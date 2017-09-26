module CoursesHelper
  def valid_params?(params)
    if params[:type].present?
      if params[:type] == "tech_elective"
        true
      elsif params[:type] == "breadth_elective"
        true
      elsif params[:type] == "core"
        true
      end
    else
      true
    end
  end
end
