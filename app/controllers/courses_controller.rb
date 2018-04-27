class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  layout "dashboard"

  def index
  end

  def show
    @course = Course.find(params[:id])
    @students = User.where("user_type == 0") - @course.users
  end

  def new
    @course = Course.new()
    2.times { @course.requirements.new() }
  end

  def create
    @course = current_user.courses.create(course_params)

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

  def add_student
    student = User.find(params[:student_id])
    course = Course.find(params[:course_id])

    course.users << student

    redirect_to course
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :description, :category, :level, :credit, :capacity, :start_date, :end_date, :closing_date, requirements_attributes: [:title, :description])
    end

end
