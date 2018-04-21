class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country, :presence => true
  validates :inventory, :presence => true

  scope :recent_products, -> { order(created_at: :desc).limit(3)}

  scope :most_reviews, -> {(
    select("products.name, products.cost, products.country, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(3)
    )}

    scope :made_in_hyrule, -> { where(country: "Hyrule Castle")}
end
