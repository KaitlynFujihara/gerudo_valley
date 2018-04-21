require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    @product = Product.create!(name: "Yochi's Sword", cost: 10, country: 'Hyrule Castle', inventory: 1)
    visit product_path(@product)
    click_link "Add a review"
    fill_in 'Author', :with => "Katie"
    fill_in 'Content', :with => "I love Zelda."
    fill_in 'Rating', :with => 2
    click_on 'Create Review'
    expect(page).to have_content 'invalid review'
  end
end
