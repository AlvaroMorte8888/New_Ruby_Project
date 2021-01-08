class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) 
    if user && user.authenticate(params[:session][:password]) # && - это синтаксис Ruby и обознаечает "и"
      # Осуществить вход пользователя и переадресовать на страницу профиля. 
    else
      # Создать сообщение об ошибке.
      flash[:danger] = 'Invalid email/password combination' # Изображает ошибку при входе, если ничего не вводить!!
      render 'new' 
    end
  end
end
