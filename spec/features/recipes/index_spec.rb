require 'rails_helper'

RSpec.describe 'recipes index will show all recipies' do


  it "will be able to see a list of recipes with the information" do

    recipe = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")

    visit "/recipes"

    expect(page).to have_content("Spaghetti")
    expect(page).to have_content(2)
    expect(page).to have_content("Italian")

  end


end
