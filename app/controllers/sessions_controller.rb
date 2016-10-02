class SessionsController < ApplicationController

  def new
    # new session page
  end

  def create
    user = User.authenticate_user(params[:session][:login], params[:session][:password])
    if user
      sign_in user
      redirect_to root_path, alert: '登录成功!'
    else
      flash.now[:danger] = '用户名或密码错误，请重新输入!'
      render 'new'
    end
  end

  def destroy
  end

  private

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out(user)
    session.delete(:user_id)
  end

end
