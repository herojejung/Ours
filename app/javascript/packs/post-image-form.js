/*global $*/
/* global SubCategory */
/* global $document */

$document.addEventListener('turbolinks:load', function () {
  const categorySelect = document.getElementById('category-select');
  const subcategorySelect = document.getElementById('post_image_sub_category_id');

  if (categorySelect && subcategorySelect) {
    categorySelect.addEventListener('change', function () {
      const selectedCategoryId = this.value;
      const subcategories = this.options[this.selectedIndex].getAttribute('data-subcategories').split(',');

      subcategorySelect.innerHTML = '';

      subcategories.forEach(function (subcategoryId) {
        const option = document.createElement('option');
        option.value = subcategoryId;
        option.innerText = document.querySelector(`[data-category-id='${selectedCategoryId}'][value='${subcategoryId}']`).innerText;
        subcategorySelect.appendChild(option);
      });
    });
  }
});

