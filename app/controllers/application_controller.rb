class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  def authenticate_user
    return redirect_to login_path, alert: '请登录后进行操作。' unless current_user
  end

end
