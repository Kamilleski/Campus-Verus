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

    @headlines = @school.get_news('6b2e6c6994b500d2b242f155275b2806:6:74617899', @school.name)
  end

end
