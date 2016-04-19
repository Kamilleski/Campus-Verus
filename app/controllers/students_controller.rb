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

  private

  def authorize_student
    if !student_signed_in? || !current_student.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
