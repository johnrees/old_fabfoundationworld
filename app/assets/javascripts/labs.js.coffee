jQuery ->

  $("#address_search").geocomplete
    map: "#map_canvas"
    details: ".details"
    detailsAttribute: "data-geo"
    markerOptions:
      draggable: true

  $("#address_search").bind "geocode:dragged", (event, latLng) ->
    $("#lab_address_attributes_latitude").val(latLng.lat())
    $("#lab_address_attributes_longitude").val(latLng.lng())
