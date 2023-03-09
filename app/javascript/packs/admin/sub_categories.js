//◆app/javascript/packs/admin/sub_category.js
document.addEventListener("turbolinks:load", () => {
  const subCategoriesForm = document.querySelector("#new_sub_category, #edit_sub_category");

  if (subCategoriesForm) {
    const subCategoryFields = document.querySelector("#sub-category-fields");

    document.querySelector("#add-sub-category").addEventListener("click", (event) => {
      event.preventDefault();

      const subCategoryCount = document.querySelectorAll(".sub-category-fields").length;
      const newSubCategory = document.createElement("div");
      newSubCategory.classList.add("sub-category-fields");

      const newNameInput = document.createElement("input");
      newNameInput.type = "text";
      newNameInput.name = `sub_categories[${subCategoryCount}][name]`;
      newNameInput.id = `sub_categories_${subCategoryCount}_name`;
      newNameInput.required = true;

      const newCategoryIdInput = document.createElement("select");
      newCategoryIdInput.name = `sub_categories[${subCategoryCount}][category_id]`;
      newCategoryIdInput.id = `sub_categories_${subCategoryCount}_category_id`;
      newCategoryIdInput.required = true;

      const categoryPrompt = document.createElement("option");
      categoryPrompt.text = "カテゴリーを選択してください";
      categoryPrompt.value = "";

      newCategoryIdInput.add(categoryPrompt);

      const categories = JSON.parse(subCategoriesForm.dataset.categories);
      categories.forEach((category) => {
        const option = document.createElement("option");
        option.text = category.name;
        option.value = category.id;

        newCategoryIdInput.add(option);
      });

      newSubCategory.appendChild(newNameInput);
      newSubCategory.appendChild(newCategoryIdInput);
      subCategoryFields.appendChild(newSubCategory);
    });
  }
});
