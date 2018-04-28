class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  layout "dashboard"

  def show
    courses = @user.courses

    if current_user.student?
        render "dashboards/students/show"
    elsif current_user.teacher?

        @ongoing_courses = courses.where("closing_date >= ?", Date.today)

        @completed_courses = courses.where("closing_date < ?", Date.today)
        render "dashboards/teachers/show"
    end
  end


  private

    def set_user
      @user = User.find(params[:id])
    end

end
