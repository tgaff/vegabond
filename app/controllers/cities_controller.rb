class CitiesController < ApplicationController
  

  def show
    @user = User.find_by_id(params[:id])
    @city = City.find_by_id(params[:id])
    @post = Post.find_by_id(params[:id])
    if @city[:id] == 1
      @cityclass = "sanfrancisco"
    elsif @city[:id] == 2
      @cityclass = "valdivia"
    elsif @city[:id] == 3
      @cityclass = "melbourne"
    else
      @cityclass = "istanbul"
    end
  end

end
