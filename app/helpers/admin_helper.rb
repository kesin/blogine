module AdminHelper

  def nav_controller_active(controller)
    current_controller?(controller) ? 'active' : ''
  end

  def active_status(status)
    if @post.present? && @post.id.present?
      status == @post.status
    else
      status == 1
    end
  end

end
