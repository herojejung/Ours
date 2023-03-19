/*global　$*/
/*global SubCategory*/
/*global jQuery*/

  $(function()  {
  // カテゴリーが変更された時に呼び出される処理
  $('#post_image_category').on('change', function() {
  var categoryId = $(this).val();
  // 選択されたカテゴリーに紐づくサブカテゴリーのみを取得
  $.ajax({
  url: '/user/sub_categories',
  data: { category_id: categoryId },
  dataType: 'json',
  success: function(subCategories) {
  // 選択されたカテゴリーに関連するサブカテゴリーのみをフィルタリング
  subCategories = subCategories.filter(function(subCategory) {
  return subCategory.category_id == categoryId;
  });
  // サブカテゴリーの選択肢を初期化
  var options = [];
  // サブカテゴリーの選択肢を動的に生成
  subCategories.forEach(function(subCategory) {
  options.push($('<option>').val(subCategory.id).text(subCategory.name));
  });
  // サブカテゴリーの選択肢を更新
  $('#post_image_sub_category_id').html($('<option>').text('選択してください').val(''));
  $('#post_image_sub_category_id').append(options);
  // 選択されたカテゴリーに紐づくサブカテゴリーが1つの場合は自動選択
  if (subCategories.length == 1) {
  $('#post_image_sub_category_id').val(subCategories[0].id);
  }
  }
  });
  });
  });

