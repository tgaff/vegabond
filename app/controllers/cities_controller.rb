class CitiesController < ApplicationController


  def show
    @city = City.find_by_id(params[:id])
    gon.cityname = @city.name
  end
end
