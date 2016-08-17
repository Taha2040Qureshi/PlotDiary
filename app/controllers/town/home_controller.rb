class Town::HomeController < Town::BaseController

  def index
    @town = current_town
  end


end
