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

$(document).on('turbolinks:load', function() {
  $('.js-toolTipHover').hover(
    function(){
      var category_list = JSON.parse($(this).attr('data-category'));
      var tooltip = $(this).find('.tooltip');
      tooltip.empty();
      $.each(category_list, function(i, category){
        var html = '<div class="sub-category-list">';
        html += '<div class="sub-category-title">' + category.name + '</div>';
        html += '<ul>';
        $.each(category.sub_categories, function(i, sub_category){
          html += '<li><a href="' + sub_category.path + '">' + sub_category.name + '</a></li>';
        });
        html += '</ul>';
        html += '</div>';
        tooltip.append(html);
      });
      tooltip.removeClass('hidden');
    },
    function(){
      var tooltip = $(this).find('.tooltip');
      tooltip.addClass('hidden');
    }
  );
});




