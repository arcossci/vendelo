class ProductsController < ApplicationController
  def index
    if params.has_key?(:search)
      @parameter = params[:search].downcase
      @products = Product.all.where("lower(title) LIKE ? OR lower(desc_text) LIKE ?", "%"+@parameter+"%","%"+@parameter+"%")
      #pp @products
      #render :index
      @categories = Category.all
    elsif params[:search].blank? || params[:search]
      @categories = Category.all
      @products = Product.all
      if params[:category_id]
        @products = @products.where(category_id: params[:category_id])
      end
      if params[:min_price].present?
        @products = @products.where("price >= ?", params[:min_price])
      end
      if params[:max_price].present?
        @products = @products.where("price <= ?", params[:max_price])
      end
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Done!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to edit_product_path, notice: 'Done!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: 'Deleted!'
  end

  private
    def product_params
      params.require(:product).permit(:title, :desc_text, :photo, :category_id, :price)
    end

end
