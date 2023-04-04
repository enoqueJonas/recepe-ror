document.addEventListener("DOMContentLoaded", function () {
  const recipePublicCheckbox = document.getElementById("recipe_public_checkbox");
  const recipePublicButton = document.querySelector("label[for='recipe_public_checkbox']");

  recipePublicButton.addEventListener("click", function () {
    recipePublicCheckbox.checked = !recipePublicCheckbox.checked;
  });
});
