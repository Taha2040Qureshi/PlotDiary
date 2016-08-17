class Town::BaseController < ApplicationController
  before_filter :authenticate_user!
  skip_before_action :verify_authenticity_token
  layout "employee_dashboard"

  def current_town
    current_user.town
  end

end