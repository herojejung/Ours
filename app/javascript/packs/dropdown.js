/*global $*/
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
  $(".category-item").mouseover(function(){
    $(this).dropdown("toggle");
  });
  $(".dropdown-menu").mouseleave(function(){
    $(this).dropdown("toggle");
  });
  $(".category-item").click(function(){
    $(this).dropdown("toggle");
  });
});
