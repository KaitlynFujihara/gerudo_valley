class WelcomeController < ApplicationController
  def index
    @products = Product.all
    @reviews= Review.all

    render :index
  end
end
