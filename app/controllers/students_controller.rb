class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
    @college_years = Student::COLLEGE_YEARS
    @names = School.names
  end

  def create
    @student = Student.new(student_params)
    @names = School.names
    if @student.save
      flash[:notice] = "Account successfully created!"
      redirect_to student_path(@student)
    else
      @college_years = Student::COLLEGE_YEARS
      flash[:error] = @student.errors.full_messages.join(". ")
      redirect_to new_student_registration_path
    end
  end

  private

  def student_params
    params.require(:student).permit(
      :first_name,
      :last_name,
      :photo_url,
      :interests,
      :year_in_college,
      :living_situation,
      :hometown,
      :description)
  end

  def authorize_student
    if !student_signed_in? || !current_student.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
