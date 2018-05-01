class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_course_and_user, only: [:add_student, :minus_student]
  before_action :set_assignment, only: [:show]

  layout "dashboard"

  def index
    @courses = Course.all.order(id: :desc)
  end

  def show
    @students = User.where(user_type: 0) - @enrolled_students

    case current_user.user_type
      when 0 
        @is_user_enrolled = @enrolled_students.where(id: current_user.id).exists? ? true : false
    end
  end

  def new
    @course = Course.new()
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
    if @course.update_attributes(course_params)
      redirect_to @course
    else
      render :edit
    end
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
      params.require(:course).permit(:title, :description, :category, :level, :credit, :capacity, :start_date, :end_date, :closing_date, requirements_attributes: [:id, :title, :description, :_destroy])
    end

    def set_course_and_user
      @student = User.find(params[:id])
      @course = Course.find(params[:course_id])
    end
    

    def set_assignment
      @enrolled_students ||= @course.users.where(user_type: 0)

      if @enrolled_students.exists?
        @enrolled_students.each do |stu|
          @course.requirements.ids.each do |r|
            if !stu.assignments.where(requirement_id: r).exists?
              Assignment.create!(user_id: stu.id, requirement_id: r)
              puts "---- Created new assignment for student #{r}"
            end
          end
        end
      end
    end
end
