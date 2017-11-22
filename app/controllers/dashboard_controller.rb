class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    authenticate_user!
    @user = current_user
  end
end
