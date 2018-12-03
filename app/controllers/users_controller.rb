class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    puts params[:id]
    @user = User.find(params[:id])
  end

end
