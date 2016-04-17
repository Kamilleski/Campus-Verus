class SchoolsController < ApplicationController
  def index
    if params[:search]
      @schools = School.search(params[:search]).order(:name)
    else
      @schools = School.all.order(:name)
    end
  end

  def show
    @school = School.find(params[:id])
  end
end
