// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap/dist/js/bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'
require("@nathanvda/cocoon")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

/*global $*/
//= require jquery3
//= require popper
//= require bootstrap
//= require google_maps
//= require_tree .

// Load Google Maps API
//const googleMapsApiScript = document.createElement('script');
//googleMapsApiScript.src = `https://maps.googleapis.com/maps/api/js?key=AIzaSyBn0RP1j3WBk9FRRNVsxwzdV_9rBjNilCw&callback=initMap`;
//document.head.appendChild(googleMapsApiScript);

// Google Maps JavaScript APIの読み込み
// if ($("#map-canvas").length > 0) {
//   const script = document.createElement("script");
//   script.src = `https://maps.googleapis.com/maps/api/js?key=AIzaSyBn0RP1j3WBk9FRRNVsxwzdV_9rBjNilCw&callback=initMap`;
//   script.async = true;
//   script.defer = true;
//   document.body.appendChild(script);
// }

require("packs/dropdown")
require("packs/post-image-form")
//require("packs/google_maps")

// window.initMap = function() {
//   const mapOptions = {
//     center: { lat: 35.6811673, lng: 139.7670516 },
//     zoom: 12
//   };
//   const e = document.getElementById('map-canvas')
//   const map = new google.maps.Map(e, mapOptions);
//   const marker = new google.maps.Marker({
//     map: map,
//     position: { lat: 35.6811673, lng: 139.7670516 },
//   });
//   // const locationField = document.getElementById('location');
// }

// window.addEventListener("DOMContentLoaded", function() {
//   const displayMapButton = document.getElementById("display-map-button")
//   if (displayMapButton) {

//     displayMapButton.addEventListener("click", function() {
//       const map = document.getElementById('map-canvas');
//       // 条件を考える必要がある どういう時にdisplay none を削除するか
//       if (map.style.display === 'none') {
//         map.style.display = ''
//       } else {
//         map.style.display = 'none'
//       }

//     })

//   }
// })

// <div class="field">
//   <%= f.label :"位置情報"%>
//   <%= f.text_field :location, id: "location", class: "form-control" %>

//   <%= button_tag "地図を表示",type: "button", id: "display" ,class:"btn btn-primary"%>
//   <%#= link_to , "#", id: "map-link", class: "btn btn-primary" %>
// </div>
// <div id="map-canvas" style="display:none;width:100%;height:400px;"></div>
// <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBn0RP1j3WBk9FRRNVsxwzdV_9rBjNilCw&callback=initMap"></script>