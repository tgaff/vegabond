class SessionsController < ApplicationController

  #created by phill and adam
  def new
    @user = User.new
    @full_background = true
  end

  #created by phill and adam
  def create
    @full_background = true
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "Successfully logged in."
      redirect_to @user
    else
      flash[:error] = "Incorrect email or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end


  # private user_params method by phill and adam
  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
