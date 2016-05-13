class CitiesController < ApplicationController
  def new
    @city = City.new 
  end
  def create
    if params[:city][:cities_main][:city_first].blank?
      render :search
    else
      @cities_main = params[:city][:cities_main] 
      a =  City.get_cities_names(@cities_main) 
      @city = City.new(cities_name: a)
    respond_to do |format|
      if @city.save
        format.js   { @cities_name = @city.cities_name }
      else
        render :search
      end
    end
    end  
  end

  def search
    @city = City.new
    city = City.last
    @cities_name = city.cities_name
  end
  
  def add_to
    render layout: false
  end

  def delete
  end



end
