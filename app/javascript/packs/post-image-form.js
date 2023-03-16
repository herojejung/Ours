/*global$*/
/*global SubCategory*/
/*global jQuery*/
var $ = jQuery;

$(function() {
// カテゴリーが変更された時に呼び出される処理
$('#post_image_category').on('change', function() {
var categoryId = $(this).val();
// 選択されたカテゴリーに紐づくサブカテゴリーのみを取得
$.ajax({
url: '/user/sub_categories',
data: { category_id: categoryId },
dataType: 'json',
success: function(subCategories) {
// サブカテゴリーの選択肢を動的に生成
var options = subCategories.map(function(subCategory) {
return $('<option>')
.val(subCategory.id)
.text(subCategory.name)
.data('category-id', subCategory.category_id);
});
// サブカテゴリーの選択肢を更新
$('#post_image_sub_category_id').html($('<option>').text('選択してください').val(''));
$('#post_image_sub_category_id').append(options);
}
});
});

// サブカテゴリーが変更された時に呼び出される処理
$('#post_image_sub_category_id').on('change', function() {
var subCategoryId = $(this).val();
if (subCategoryId) {
var categoryId = $('#post_image_sub_category_id option:selected').data('category-id');
$('#post_image_category').val(categoryId).change();
}
});
});