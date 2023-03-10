document.addEventListener("turbolinks:load", () => {
  const subCategoriesForm = document.querySelector("#new_sub_category, #edit_sub_category");

  if (subCategoriesForm) {
    const subCategoryFields = document.querySelector("#sub-category-fields");
    const subCategoryTemplate = document.querySelector("#sub-category-template");

    document.querySelector("#add-sub-category").addEventListener("click", (event) => {
      event.preventDefault();

      const subCategoryCount = document.querySelectorAll(".sub-category-fields").length;
      const newSubCategory = subCategoryTemplate.content.cloneNode(true).querySelector(".sub-category-fields");

      newSubCategory.querySelector(".name-input").name = `sub_categories[${subCategoryCount}][name]`;
      newSubCategory.querySelector(".category-id-input").name = `sub_categories[${subCategoryCount}][category_id]`;
      subCategoryFields.appendChild(newSubCategory);
    });

    subCategoryFields.addEventListener("click", (event) => {
      if (event.target.classList.contains("remove-sub-category")) {
        event.preventDefault();
        event.target.closest(".sub-category-fields").remove();
      }
    });

    subCategoriesForm.addEventListener("submit", (event) => {
      const subCategoryInputs = subCategoriesForm.querySelectorAll(".sub-category-fields input");
      subCategoryInputs.forEach((input) => {
        input.disabled = false;
      });
    });
  }
});