module ApplicationHelper
  def is_active(tab)
    return true if tab.downcase == params[:action].downcase
    return false
  end

end
