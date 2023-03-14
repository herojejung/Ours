/*global $*/
$(function() {
  // カテゴリーが変更された時に呼び出される処理
  $('#post_image_category').on('change', function() {
    var categoryId = $(this).val();

    // 選択されたカテゴリーに紐づくサブカテゴリーのみを取得
    $.ajax({
      url: '/user/sub_categories',
      type: 'GET',
      data: {
        category_id: categoryId
      },
      dataType: 'json'
    }).done(function(subCategories) {
      // サブカテゴリーの選択肢を動的に生成
      var options = subCategories.map(function(subCategory) {
        return $('<option>')
          .val(subCategory.id)
          .text(subCategory.name)
          .data('category-id', subCategory.category_id);
      });

      // サブカテゴリーの選択肢を更新
      $('#post_image_subcategory').html(options);
    }).fail(function() {
      // エラーが発生した場合の処理
      alert('エラーが発生しました');
    });
  });
});
