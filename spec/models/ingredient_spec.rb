require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :cost}
  end

  describe 'relationships' do
    it {should have_many :recipe_ingredients}
    it {should have_many(:recipes).through(:recipe_ingredients)}
  end

  describe 'model methods' do
    it "can recipe_count" do
      recipe = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      recipe_2 = Recipe.create!(name: "hotdog", complexity: 1, genre: "American")

      ingredient = Ingredient.create!(name: "Meat", cost: 20)

      recipe_ingredients = RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: ingredient.id)
      recipe_ingredients = RecipeIngredient.create!(recipe_id: recipe_2.id, ingredient_id: ingredient.id)


      expect(ingredient.recipe_count).to eq(2)

    end
  end

  describe 'model testing' do
    it "self.total_cost" do
      recipe = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
      ingredient = recipe.ingredients.create!(name: "Pasta", cost: 10)
      ingredient = recipe.ingredients.create!(name: "Meat", cost: 10)
      ingredient = recipe.ingredients.create!(name: "Cheese", cost: 2)

      expect(Ingredient.total_cost).to eq(22)
    end
  end
end
