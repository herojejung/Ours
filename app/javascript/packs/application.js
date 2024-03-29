// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
//import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
//import "channels"

import "jquery";
import "popper.js";
import "bootstrap/dist/js/bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'
require("@nathanvda/cocoon")

Rails.start()
//Turbolinks.start()
ActiveStorage.start()

$(document).on('click', '.remove_fields', function(event) {
  $(this).prev('input[type=hidden]').val('1');
  $(this).closest('.nested-fields-category').hide();
  return event.preventDefault();
});

$('.slick-slider').on('afterChange', function() {
  $('.slick-prev').removeClass('slick-active');
  $('.slick-next').removeClass('slick-active');
});

require("packs/dropdown")
require("packs/post-image-form")
//require("packs/preview")
//require("packs/prevImage")

/*global $*/
//= require jquery3
//= require popper
//= require bootstrap
//= require google_maps
//= require_tree .





