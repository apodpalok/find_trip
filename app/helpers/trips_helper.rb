module TripsHelper
  def nav_tabs_active
    return  'active' if params[:action] == 'active'
  end

  def nav_tabs_archived
    return  'active' if params[:action] == 'archived'
  end
end
