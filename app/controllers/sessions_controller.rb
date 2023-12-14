class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session]["メールアドレス"]&.downcase)
    if user && user.authenticate(params[:session]["パスワード"])
      forwarding_url = session[:forwarding_url]
      reset_session
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      log_in user
      redirect_to forwarding_url || user
    else
      flash.now[:danger] = 'メールアドレス、もしくはパスワードが違います'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url, status: :see_other
  end
end
