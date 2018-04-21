Product.destroy_all
Review.destroy_all

50.times do |index|
  Product.create!(name: Faker::Zelda.item, cost: Faker::Number.between(1, 100), country: Faker::Zelda.location, inventory: Faker::Number.between(0, 1000))
  @product_id = Product.last.id
  5.times do |t|
    Review.create!(author: Faker::Zelda.character, content: Faker::Hipster.paragraph(3), rating: Faker::Number.between(1, 5), product_id: @product_id)
  end
end

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
