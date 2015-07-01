$(function() {

  $.getJSON(window.location.pathname + '.json', function(data) {
    var lat = data.venue.latitude
    var lon = data.venue.longitude
    var name = data.venue.name
    var location = lat + ', ' + lon;

    L.mapbox.accessToken = 'pk.eyJ1Ijoicm9jY3N0YXIiLCJhIjoiZkVjaWxxNCJ9.hBQ1xIi0UENyLK-CGZ-WVA';
    var map = L.mapbox.map('map', 'examples.map-i86nkdio')
      .setView([lat, lon], 15);

      L.mapbox.featureLayer({

      type: 'Feature',
      geometry: {
          type: 'Point',
          coordinates: [lon, lat]},
      properties: {
          title: name,
          description: location,
          'marker-size': 'large',
          'marker-color': '#1F3A85',
          'marker-symbol': 'star'
      }
    }).addTo(map);
  })
});
