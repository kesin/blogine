class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  def authenticate_user
    return redirect_to login_path, alert: '请登录后进行操作。' unless current_user
  end

  def render_404
    render file: Rails.root.join("public", "404.html"), layout: false, status: "404"
  end

end
