class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) 
    if user && user.authenticate(params[:session][:password]) # && - это синтаксис Ruby и обознаечает "и"
      # Осуществить вход пользователя и переадресовать на страницу профиля. 
      log_in user
      redirect_to user # форма переадресации
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new' 
    end
  end

  def destroy
  end  
end
