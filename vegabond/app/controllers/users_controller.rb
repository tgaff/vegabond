class UsersController < ApplicationController
  # created by ilter, marcelo

  before_action :logged_in?, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts
    render :show
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user
  end

  # created by ilter, marcelo
  def logged_in?
    if session[:user_id] == nil
      flash[:notice] = "Must be logged in to see this page"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:born_city,:current_city,
    :favorite_destination,:bio,:fav_travel_story,:password,:email)
  end
end
