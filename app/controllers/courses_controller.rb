class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  layout "dashboard"

  def index
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new()
  end

  def create
    @course = Course.create(course_params)
    puts "--------------------------"
    puts @course.errors.full_messages
    if @course.save
      redirect_to @course
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "강의가 삭제되었습니다." }
    end
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :teacher_id, :description, :category, :level, :credit, :capacity, :start_date, :end_date, :closing_date)
    end
end
