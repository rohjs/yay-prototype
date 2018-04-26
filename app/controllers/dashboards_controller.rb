class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  layout "dashboard"
  
  def show
    case @user.user_type
      when 0
        render "dashboards/students/show"
      when 1
        render "dashboards/teachers/show"
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

end
