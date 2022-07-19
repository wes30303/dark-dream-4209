require 'rails_helper'

RSpec.describe 'I see a list of the names of the ingredients the recipe has.' do


  it "will list of the names of the ingredients the recipe has" do

    recipe = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
    ingredient = recipe.ingredients.create!(name: "Pasta", cost: 10)
    ingredient = recipe.ingredients.create!(name: "Meat", cost: 10)
    ingredient = recipe.ingredients.create!(name: "Cheese", cost: 10)

    visit "/recipes/#{recipe.id}"

    expect(page).to have_content("Pasta")
    expect(page).to have_content("Meat")
    expect(page).to have_content("Cheese")
  end

  it "will show the total cost of the recipe" do

    recipe = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
    ingredient = recipe.ingredients.create!(name: "Pasta", cost: 10)
    ingredient = recipe.ingredients.create!(name: "Meat", cost: 10)
    ingredient = recipe.ingredients.create!(name: "Cheese", cost: 2)

    visit "/recipes/#{recipe.id}"

    expect(page).to have_content(22)
  end

end
