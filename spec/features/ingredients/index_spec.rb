require 'rails_helper'

RSpec.describe 'I see a list of the names of the ingredients the recipe has.' do


  it "will list of the names of the ingredients the recipe has" do

    recipe = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
    recipe_2 = Recipe.create!(name: "hotdog", complexity: 1, genre: "American")

    ingredient = Ingredient.create!(name: "Meat", cost: 20)

    recipe_ingredients = RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: ingredient.id)
    recipe_ingredients = RecipeIngredient.create!(recipe_id: recipe_2.id, ingredient_id: ingredient.id)

    visit '/ingredients'

    expect(page). to have_content("Meat: 2")
  end

end
