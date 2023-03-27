/*global　$*/
/*global SubCategory*/
/*global jQuery*/
$(function() {
  // カテゴリーが変更された時に呼び出される処理
  // カテゴリーのセレクトボックスの要素を取得する
const categorySelect = document.querySelector('#category-select');

if (!!categorySelect) {

// カテゴリーのセレクトボックスが変更された場合のイベントを設定する
categorySelect.addEventListener('change', () => {
  // カテゴリーの選択値を取得する
  const selectedCategoryId = categorySelect.value;

  // 選択されたカテゴリーに対応するサブカテゴリーの要素を取得する
  const subCategoryOptions = document.querySelectorAll(`option[data-category-id="${selectedCategoryId}"]`);

  // すべてのサブカテゴリーの要素を非表示にする
  document.querySelectorAll('#post_image_sub_category_id option').forEach((option) => {
    option.style.display = 'none';
  });

  // 選択されたカテゴリーに対応するサブカテゴリーの要素だけを表示する
  subCategoryOptions.forEach((option) => {
    option.style.display = 'block';
  });
});
}
});
