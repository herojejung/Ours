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
//= require_tree .

$(document).ready(function(){
  // カテゴリーにカーソルが乗ったらドロップダウンメニューを表示する
  $('.js-toolTipHover').hover(
    function() {
      $(this).children('.dropdown-menu').addClass('show');
    },
    function() {
      $(this).children('.dropdown-menu').removeClass('show');
    }
  );
});




