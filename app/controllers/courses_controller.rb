class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_course_and_user, only: [:add_student, :minus_student]

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
    @course.users << @student
    @course.requirements.each do |req|
      Assignment.create!(user_id: @student.id, requirement_id: req.id)
    end

    redirect_to @course
  end

  def minus_student
    @course.users.delete(@student)
    @course.requirements.each do |req|
      Assignment.where(user_id: @student, requirement_id: req.id).destroy_all
    end

    redirect_to @course
  end

  private

    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:title, :description, :category, :level, :credit, :capacity, :start_date, :end_date, :closing_date, requirements_attributes: [:title, :description])
    end

    def set_course_and_user
      @student = User.find(params[:id])
      @course = Course.find(params[:course_id])
    end



end
