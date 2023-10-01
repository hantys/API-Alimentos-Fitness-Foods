class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  # GET /products
  def index
    @products = Product.order(:product_name).page(params[:page]).per(params[:per_page])

    pagination_header(@products)

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = ProductForm.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.status = 'trash'

    if @product.save
      render json: "DELETADO", status: :ok
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find_by(code: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:code, :status, :imported_t, :url,
                                    :creator, :created_t, :last_modified_t, :product_name,
                                    :quantity, :cities, :purchase_places, :ingredients_text,
                                    :traces, :serving_size, :serving_quantity, :nutriscore_score,
                                    :nutriscore_grade, :main_category, :image_url,
                                    :brands, :categories, :labels, :stores)
  end
end
