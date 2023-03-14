/*global $*/
$(document).on('change', '#post_image_category_id', function() {
  var categoryId = $(this).val();
  var subcategories = $(this).find(':selected').data('subcategories');

  // サブカテゴリーを更新する
  updateSubcategories(subcategories);
});

function updateSubcategories(subcategories) {
  var select = $('#post_image_sub_category_id');
  select.empty();

  $.each(subcategories, function(i, subcategoryId) {
    var option = $('<option>').val(subcategoryId).text($('option[value="' + subcategoryId + '"]', '#post_image_sub_category_id').text());
    select.append(option);
  });
}

$(function() {
  var categoryId = $('#post_image_category_id').val();
  var subcategories = $('#post_image_category_id :selected').data('subcategories');
  updateSubcategories(subcategories);
});

$(function() {
  var categoryId = $('#post_image_category_id').val();
  var subcategories = $('#post_image_category_id :selected').data('subcategories');
  updateSubcategories(subcategories);

$('#post_image_category_id').on('change', function() {
    var categoryId = $(this).val();
    var subcategories = $(this).find(':selected').data('subcategories');

    // サブカテゴリーを更新する
    updateSubcategories(subcategories);
  });
});