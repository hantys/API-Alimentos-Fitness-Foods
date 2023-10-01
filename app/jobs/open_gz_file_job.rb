class OpenGzFileJob < ApplicationJob
  queue_as :default

  def perform(file_url)
    URI.open(file_url) do |gz_file|
      # Use Zlib::GzipReader para ler o arquivo compactado
      Zlib::GzipReader.wrap(gz_file) do |uncompressed_file|
        # Leia 100 linhas do arquivo descompactado
        100.times do
          product_line = uncompressed_file.gets
          break unless product_line # Sai se chegarmos ao final do arquivo

          product_data = JSON.parse(product_line)
          product_data["imported_t"] = Time.now

          process_product(product_data)
        rescue StandardError
          next
        end
      end
    end
    REDIS.set('last_job_time', Time.now)
  end

  def process_product(product_data)
    product_params = format_params(product_data)

    find_or_create(product_params)
  rescue StandardError => e
    puts "error: #{e}"
  end

  def find_or_create(product_params)
    code = product_params[:code]
    product_search = Product.find_by(code:)
    product = if product_search.present?
                ProductUpdateForm.new(product_params)
              else
                ProductForm.new(product_params)
              end
    product.save
  end

  def format_params(product_params)
    {
      code: product_params["code"], status: product_params["status"], imported_t: product_params["imported_t"],
      url: product_params["url"], creator: product_params["creator"],
      created_t: product_params["created_t"], last_modified_t: product_params["last_modified_t"],
      product_name: product_params["product_name"], purchase_places: product_params["purchase_places"],
      ingredients_text: product_params["ingredients_text"], traces: product_params["traces"],
      serving_size: product_params["serving_size"], serving_quantity: product_params["serving_quantity"],
      nutriscore_score: product_params["nutriscore_score"], nutriscore_grade: product_params["nutriscore_grade"],
      main_category: product_params["main_category"], quantity: product_params["quantity"],
      cities: product_params["cities"],      image_url: product_params["image_url"],
      brands: product_params["brands"],      categories: product_params["categories"],
      labels: product_params["labels"],      stores: product_params["stores"]
    }
  end
end
