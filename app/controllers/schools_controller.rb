class SchoolsController < ApplicationController
  def index
    if params[:search]
      @schools = School.search(params[:search]).order(:name).page params[:page]
    else
      @schools = School.all.order(:name).page params[:page]
    end

    def max_number_index_pages(pages_per)
      num_schools = School.all.length
      return (num_schools / pages_per).ceil
    end
  end

  def show
    @school = School.find(params[:id])
  end

  def max_number_index_pages(pages_per)
    num_schools = School.all.length
    return (num_schools / pages_per).ceil
  end
end
