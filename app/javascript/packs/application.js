// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


import Rails from "@rails/ujs"
//import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap/dist/js/bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'
require("@nathanvda/cocoon")

Rails.start()
//Turbolinks.start()
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


//require("packs/google_maps")
require("packs/dropdown")
require("packs/postimageform")


