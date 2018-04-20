require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    visit new_product_review_path
    click_link "Add a review"
    fill_in 'Author', :with => "Katie"
    fill_in 'Content', :with => "I love Zelda. It is such a fun game. Sometimes it gets too frustrating and I have no other option but to quit."
    fill_in 'Rating', :with => 2
    click_on 'Create Review'
    expect(page).to have_content 'Reviews'
  end

  it "gives error when no name is entered" do
    visit new_product_path
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end
  it "gives error when no cost is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
  it "gives error when no country is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end
