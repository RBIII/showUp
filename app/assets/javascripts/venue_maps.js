$(function() {

  $.getJSON(window.location.pathname + '.json', function(data) {
    var lat = data.venue.latitude
    var lon = data.venue.longitude

    L.mapbox.accessToken = 'pk.eyJ1Ijoicm9jY3N0YXIiLCJhIjoiZkVjaWxxNCJ9.hBQ1xIi0UENyLK-CGZ-WVA';
    var map = L.mapbox.map('map', 'examples.map-i86nkdio')
      .setView([lat, lon], 9);
  })



});
