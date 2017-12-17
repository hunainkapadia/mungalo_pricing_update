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

end
