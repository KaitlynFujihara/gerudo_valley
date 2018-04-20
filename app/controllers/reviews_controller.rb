class ReviewsController < ApplicationController
  def new
    @review = Review.find(params[:product_id])
    @product = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(reviews_params)
    if @review.save
      redirect_to product_path(@review.product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @product = Product.find(params[:product_id])
    @product = Product.find(params[:id])
    if @review.update(reviews_params)
      redirect_to product_path(@review.product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end

  private
    def reviews_params
      params.require(:review).permit(:author, :content, :rating)
    end
end
