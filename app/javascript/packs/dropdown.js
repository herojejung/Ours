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

$(document).ready(function() {
  $('.dropdown-menu a').click(function(e) {
    var $this = $(this); // 追加
    var category_id = $this.data('category-id');
    $.ajax({
      url: "/user/sub_categories?category_id=" + category_id,
      dataType: "json",
      success: function(data) {
        var sub_categories_html = '';
        $.each(data, function(index, sub_category) {
          sub_categories_html += '<li><a href="/user/sub_categories/' + sub_category.id + '">' + sub_category.name + '</a></li>';
        });
        $('#sub_categories_list').html(sub_categories_html);
        $('.dropdown-toggle.category-item').html($this.text() + ' <span class="caret"></span>'); // 修正
      }
    });
  });
});
