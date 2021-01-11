class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) 
    if user && user.authenticate(params[:session][:password]) # && - это синтаксис Ruby и обознаечает "и"
      # Осуществить вход пользователя и переадресовать на страницу профиля. 
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      remember user # входи и запомнинание пользователя
      redirect_to user # форма переадресации
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new' 
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end  
end
