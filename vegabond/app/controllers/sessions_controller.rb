class SessionsController < ApplicationController

  #created by phill and adam
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to @user
    else
      redirect_to login_path
    end
  end


  # private user_params method by phill and adam
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
