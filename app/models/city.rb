class City < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode 
 
  def self.get_cities_names(cities)
    array = []
    cities.each_pair {|key, value| array << value unless value.empty? }
    array
  end
end
