module SessionsHelper

  def current_user
    return @current_user if defined? @current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    elsif cookies.signed[:user_id]
      user = User.find_by(id: cookies.signed[:user_id])
      if user && user.authenticate_with_remember(cookies.signed[:remember_token])
        sign_in user
        @current_user = user
      end
    end
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete(:user_id)
  end

  def remember_me(user)
    user.remember_me
    cookies.permanent.signed[:remember_token] = user.remember_token
    cookies.permanent.signed[:user_id] = user.id
  end

  def forget_me(user)
    user.forget_me
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

end
