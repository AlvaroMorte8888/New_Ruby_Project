class UsersController < ApplicationController
  protect_from_forgery 
  
  def show
    @user = User.find(params[:id])
  end  
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save # сохроняет пользователя
      log_in @user # перебрасывает на созданого юзера
      flash[:success] = "Welcome to the Yoga Blog!" # отображает правильный вход
      redirect_to @user
    else 
      render 'new'   
    end
  end    

  def edit
    @user = User.find(params[:id])
  end  
end


private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end  