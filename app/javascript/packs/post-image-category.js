/*global $*/
  $(document).on('change', '#post_image_category', function() {
    var category_id = $(this).val();
    var subcategories = $(this).find('option:selected').data('subcategories').split(',');
    var options = $('#post_image_subcategory option');

    options.hide();
    options.filter(function() {
      return $.inArray($(this).data('categoryId').toString(), subcategories) !== -1;
    }).show();

    if ($.inArray($('#post_image_subcategory').val(), subcategories) === -1) {
      $('#post_image_subcategory').val('');
    }
  });
