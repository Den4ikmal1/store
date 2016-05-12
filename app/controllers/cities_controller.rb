class CitiesController < ApplicationController
  def new
    @city = City.new 
  end
  def create
    @cities_main = params[:city][:cities_main]
    if params[:city][:cities_midrange] 
      @cities_midrange = params[:city][:cities_midrange] 
      a =  City.get_cities_names(@cities_main) | City.get_cities_names(@cities_midrange)
    else
      a ||=  City.get_cities_names(@cities_main)
    end
      @city = City.new(cities_name: a)
    respond_to do |format|
      if @city.save
        format.js   { @cities_name = @city.cities_name }
      else
        render :search
      end
    end
      
  end

  def search
    @city = City.new
    city = City.last
    @cities_name = city.cities_name
  end

end
