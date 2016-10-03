class SessionsController < ApplicationController

  include SessionsHelper

  def new
    # new session page
  end

  def create
    user = User.authenticate_user(params[:session][:login], params[:session][:password])
    if user
      sign_in user
      params[:session][:remember_me] == '1' ? remember_me(user) : forget_me(user)
      redirect_to root_path, alert: '登录成功!'
    else
      flash.now[:danger] = '用户名或密码错误，请重新输入!'
      render 'new'
    end
  end

  def destroy
    forget_me(current_user) if current_user
    sign_out
    redirect_to root_path, alert: '退出成功!'
  end

end
