class UsersController < ApplicationController
  # created by ilter, marcelo

  before_action :logged_in?, only: [:show]

  def index
    @users = User.all
    @full_background = true
    
  end

  def new
    @user = User.new
    @full_background = true
  end

  def create
    @user = User.create(user_params)
    if @user.save
      login(@user)
      redirect_to @user
    else
      @full_background = true
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts
    @city = City.find_by_id(params[:id])
    # post = Post.find_by_id(params[:id])
    @full_background = false
    @cityclass = "page"
  end

  def edit
    @user = User.find_by_id(params[:id])
    @full_background = true
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
    params.require(:user).permit(:avatar,:first_name,:last_name,:born_city,:current_city,
    :favorite_destination,:bio,:fav_travel_story,:password,:email)
  end
end
