class CitiesController < ApplicationController

  def new
    @city = City.new

  end

  def create
    @cities = params[:city][:cities_name]
    @cities_midrange = params[:city][:cities_midrange]
 

    @city = City.create(cities_name: City.get_cities_names(@cities) | City.get_cities_names(@cities_midrange))
    redirect_to root_url
  end

  def index
    @city = City.last
    @cities_name = @city.cities_name
    @cities_midrange = @city.cities_midrange
    @cities = City.all
  end

  private 
    def city_params
      params.require(:city).permit(:cities_name, :cities_midrange)
    end
end
