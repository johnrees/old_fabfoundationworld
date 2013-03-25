window.searchTerm = ""
window.kind = null

center = (position) ->
  latitude = position.coords.latitude
  longitude = position.coords.longitude
  window.map.setView([latitude, longitude], 7)

show_map = ->
  window.map.setView([41,2], 2)
  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map)

  L.Control.Zoom
    options:
      position: 'topright'

row = (key, value) ->
  "<tr><th>#{key}</th><td>#{value}<td></tr>"

enable = (marker) ->
  marker.bindPopup(marker.desc).setOpacity(1)

disable = (marker) ->
  marker.closePopup().unbindPopup().setOpacity(0)

filter = ->
  for lab in window.labs
    disable(lab.marker)

    if window.searchTerm is ""
      enable(lab.marker)
    else
      for word in ["name", "location", "email"]
        if lab[word].match(new RegExp(window.searchTerm, "i"))
          enable(lab.marker)
          break

    if window.kind and window.kind != lab.kind
      disable(lab.marker)


jQuery ->
  window.map = L.map('map')
  window.labs = []
  show_map()

  # $.get "/labs.json", (labs) ->
  #   for lab in labs
  #     lab.marker = L.marker([lab.latitude, lab.longitude], {
  #       icon: L.icon
  #         iconUrl: "./images/#{lab.kind}-icon.png"
  #         iconSize:     [35, 35]
  #         iconAnchor:   [17, 33]
  #         popupAnchor:  [0, -20]
  #     }).addTo(map)

  #     lab.marker.desc = "<h1>#{lab.name}</h1>"
  #     lab.marker.desc += "<table>"
  #     for word in ["location", "city", "email", "phone"]
  #       lab.marker.desc += row(word,lab[word]) if lab[word]
  #     lab.marker.desc += "</table>"
  #     lab.marker.bindPopup(lab.marker.desc)

  #     window.labs.push(lab)

  # $('li.kind').click (e) ->
  #   $('li.kind').removeClass('active')
  #   $(this).addClass('active')
  #   window.kind = (if $(this).attr('id') is 'alltypes' then null else $(this).data('type'))
  #   filter()

  # $('input').keyup ->
  #   window.searchTerm = $(this).val()
  #   filter()

  # $('#alltypes').click()

  navigator.geolocation.getCurrentPosition(center)

