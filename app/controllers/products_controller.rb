class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end
  def new
   @product = Product.new
 end
 def create
   @product = Product.new(product_params)
   flash[:notice] = "#{@product.name} was added to the list!"
   if @product.save
     redirect_to  products_path
   else
     render :new
   end
 end
 def edit
   @product= Product.find(params[:id])
   render :edit
 end
 def update
   @product= Product.find(params[:id])
   if @product.update(product_params)
     flash[:notice] = "#{@product.name} was updated!"
     redirect_to products_path
   else
     render :edit
     end
   end
 def destroy
   @product = Product.find(params[:id])
   @product.destroy
    flash[:notice] = "#{@product.name} was deleted."
   redirect_to products_path
 end
 def show
   @product = Product.find(params[:id])
   render :show
 end
 private
 def product_params
   params.require(:product).permit(:name, :cost, :country, :inventory)
 end
end
