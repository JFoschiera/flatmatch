import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      zoom: 9
    })
    this._addMarkersToMap()
    this._fitMapToMarkers()
    this._addZoomToMap()
  }

  _addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    });
  }

  _fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { minZoom:3, maxZoom: 13, duration: 2000 })
  }

  _addZoomToMap() {
      this.map.addControl(new mapboxgl.NavigationControl());
      document.getElementById('listing-group').addEventListener('change', (e) => {
        const handler = e.target.id;
        if (e.target.checked) {
            map[handler].enable();
        } else {
            map[handler].disable();
        }
      });
  }
}
