Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Zelda.item, cost: Faker::Number.between(1, 100), country: Faker::Zelda.location)
end

p "Created #{Product.count} products"
