module AdminHelper
  def nav_controller_active(controller)
    current_controller?(controller) ? 'active' : ''
  end
end
