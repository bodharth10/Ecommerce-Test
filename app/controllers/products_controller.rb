class ProductsController < ApplicationController
  before_action :set_product, only: :create
  before_action :get_product, only: [:update, :destroy, :show]
  before_action :authenticate_user!, only: :index

  def index
    if params.key?('search')
      search = params[:search]
      @products = Product.search do
        fulltext search
      end
      @products = @products.results
    else
      @products = Product.all
    end
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find params[:id]
  end

  def new
    @product = Product.new
  end

  def edit
    if current_user.admin?
     @product = Product.find params[:id]
    end 
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, success: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if current_user.admin?
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to products_path, success: 'Product was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end  
  end

  def destroy
    if current_user.admin?
      @product.destroy
      respond_to do |format|
        format.html { redirect_to products_url, success: 'Product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end  
  end

  def order_history
    if current_user.admin?
      @order_history = Order.where("product_id is not null")
    else
      @order_history = current_user.orders
    end
  end

  private
  def set_product
    @product = Product.new(product_params)
  end

  def get_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit!
  end
end
