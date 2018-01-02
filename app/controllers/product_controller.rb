class ProductController < ApplicationController

  def index
    @AllProducts = Product.all
    @newpriceproducts = Product.where(:new_price => nil).count
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

  def export
    puts "exappporting now"
    @products = Product.all
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv, filename: "pricing-tool-output-#{Date.today}.csv" }
    end
      #redirect_to root_url, notice: "All Products Exported"
  end

  def update
  @product = Product.find(params[:id])
  @product.update(product_params)
  @productid  = params[:id]

  respond_to do |f|
    f.html { redirect_to root_url }
    f.js
  end
  end

  private
    def product_params
      params.require(:product).permit(:current_price, :new_price)
    end
end
