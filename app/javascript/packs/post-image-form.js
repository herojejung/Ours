/*global $*/
/* global SubCategory */

$(function() {
  // カテゴリーが変更された時に呼び出される処理
  $('#post_image_category').on('change', function() {
    var categoryId = $(this).val();

    // 選択されたカテゴリーに紐づくサブカテゴリーのみを取得
    var subCategoryIds = $(this).find(':selected').data('subcategories').split(',');
    var subCategories = SubCategory.where({id: subCategoryIds}).toJSON();

    // サブカテゴリーの選択肢を動的に生成
    var options = subCategories.map(function(subCategory) {
      return $('<option>')
        .val(subCategory.id)
        .text(subCategory.name)
        .data('category-id', subCategory.category_id);
    });

    // サブカテゴリーの選択肢を更新
    $('#post_image_sub_category_id').html(options);
  });
});
