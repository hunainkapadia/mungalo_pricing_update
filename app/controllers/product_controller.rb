class ProductController < ApplicationController

  def index
    @AllProducts = Product.all
  end

#Used to delete all records
  def show
    cmd = params[:id]
    if cmd == "destroyall"
      @alldeletedproducts= Product.all
      @alldeletedproducts.delete_all
    else
    end
    redirect_to root_url, notice: "All Products Deleted"
  end

#Import CSV
  def import
   Product.import(params[:file])
   redirect_to root_url, notice: "All Products Imported"
  end

  def update
  @product = Product.find(params[:id])
  @product.update(product_params)
  #@product.update(:new_price => params[:product][:new_price])
  #product_new_price = params[:product][:new_price]
  redirect_to root_url
  end

  private
    def product_params
      params.require(:product).permit(:current_price, :new_price)
    end
end
