class UsersController < ApplicationController


  def index

    @users = User.all

  end

  def show

    @user = User.find_by_id(params[:id])

  end

  def new

    @user = User.new

  end

  def create

    @user = User.create(user_params)
  end

  def update

    @user = User.find_by_id(params[:id])
    @user.update_attributes(user_params)
  end

  private

  def user_params

    params.require(:user).permit(:first_name,:last_name,:born_city,:current_city,
    :favorite_destination,:bio,:fav_travel_story,:password,:email)

  end
end
