/*global $*/
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

// $(document).ready(function(){
//   $(".category-item").mouseover(function(){
//     $(this).dropdown("toggle");
//   });
//   $(".dropdown-menu").mouseleave(function(){
//     $(this).dropdown("toggle");
//   });
//   $(".category-item").click(function(){
//     $(this).dropdown("toggle");
//   });
// });

$(document).ready(function () {
  $(".dropdown").mouseover(function () {
    $('.dropdown').addClass('show')
    $('.dropdown-menu').addClass('show')
    $('.dropdown-toggle').attr('aria-expanded', 'true')
  })

  $(".dropdown").mouseleave(function () {
    $('.dropdown').removeClass('show')
    $('.dropdown-menu').removeClass('show')
    $('.dropdown-toggle').attr('aria-expanded', 'false')
  })
})