class WelcomeController < ApplicationController
  def index
    @most_reviewed = Product.order("product.reviews.length DESC").limit(3)
    @recent_products= Product.order("created_at DESC").limit(3)
    render :index
  end
end
