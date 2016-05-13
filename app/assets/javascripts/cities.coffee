$ ->
  $("#hello").on 'ajax:success', (e, data, status, xhr) ->
    $('.new-point').append data

  $("#delete").on "click", () ->
    $(".lol").remove();

    

class RichMarkerBuilder extends Gmaps.Google.Builders.Marker 

@buildMap = (cities_name) -> 
  directionsDisplay = new (google.maps.DirectionsRenderer)
  directionsService = new (google.maps.DirectionsService)

  calcRoute = (city_from, city_to, waypts) ->
    request = 
      origin: city_from
      destination: city_to
      waypoints: waypts
      optimizeWaypoints: true
      travelMode: google.maps.TravelMode.DRIVING
    directionsService.route request, (response, status) ->
      if status == google.maps.DirectionsStatus.OK
        directionsDisplay.setDirections response
      return
    return

  calculateAndDisplayRoute = (cities_name) ->
    waypts = []
    i = 1
    while i < cities_name.length - 1
      waypts.push
        location: cities_name[i]
        stopover: true
      i++
    waypts
  

  if cities_name.length == 1
    calcRoute cities_name[0], cities_name[cities_name.length - 1]
  else
    calcRoute cities_name[0], cities_name[cities_name.length - 1], calculateAndDisplayRoute cities_name
     

  handler = Gmaps.build('Google')
  handler.buildMap { internal: id: 'directions' }, ->
    directionsDisplay.setMap handler.getMap()
    return
