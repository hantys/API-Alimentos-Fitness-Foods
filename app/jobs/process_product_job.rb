class ProcessProductJob < ApplicationJob
  queue_as :default

  def perform(product_params)
    @product_params = product_params
    code = product_params[:code]

    find_or_create(code)
  rescue StandardError => e
    puts "error: #{e}"
  end

  def find_or_create(code)
    product_search = Product.find_by(code:)
    product = if product_search.present?
                ProductUpdateForm.new(@product_params)
              else
                ProductForm.new(@product_params)
              end
    product.save
  end

end
