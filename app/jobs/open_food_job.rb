class OpenFoodJob < ApplicationJob
  queue_as :default

  def perform
    url = 'https://static.openfoodfacts.org/data/delta/index.txt'

    # Abre o arquivo a partir do URL
    URI.open(url) do |file|
      file.each_line do |line|
        line = line.strip

        # Crie o URL para baixar o arquivo gz
        file_url = "https://static.openfoodfacts.org/data/delta/#{line}"

        puts "****#{file_url}****"
        # Baixe o arquivo gz e descompacte-o
        OpenGzFileJob.perform_later(file_url)
      end
    end
  end
end
