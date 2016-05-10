class RichMarkerBuilder extends Gmaps.Google.Builders.Marker 


@buildMap = (cities_name)-> 
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
    i = 2
    while i < cities_name.length
      waypts.push
        location: cities_name[i]
        stopover: true
      i++
    waypts
  
  i = 0
  while i < cities_name.length
    calcRoute cities_name[0], cities_name[1], calculateAndDisplayRoute cities_name
    i++

  handler = Gmaps.build('Google')
  handler.buildMap { internal: id: 'directions' }, ->
    directionsDisplay.setMap handler.getMap()
    return

 
