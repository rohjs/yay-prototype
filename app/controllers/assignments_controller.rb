class AssignmentsController < ApplicationController
  def check_assignment
    # 학생과 assignment
    # 코스랑 유저 아이디 넘김

    Assignment.find_by(
      requirement_id: assignment_params[:requirement_id],
      user_id: assignment_params[:user_id] )
      .update(status: assignment_params[:status])

    course =  Requirement.find(assignment_params[:requirement_id]).course
    redirect_to course
  end

  def update_assignment

  end

  private
  def assignment_params
    params.require(:assignment).permit(:status, :user_id, :requirement_id)
  end
end
