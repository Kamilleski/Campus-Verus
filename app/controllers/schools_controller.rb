class SchoolsController < ApplicationController
  def index
    if params[:search]
      @schools = School.search(params[:search]).order(:name).page params[:page]
    else
      @schools = School.all.order(:name).page params[:page]
    end
  end

  def show
    @school = School.find(params[:id])
    @students = @school.students.order(created_at: :desc).page params[:page]
  end
end
