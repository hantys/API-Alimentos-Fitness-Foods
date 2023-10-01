class BrandForm
  include ActiveModel::Model

  attr_reader :brand
  attr_accessor :name

  def save
    brand_create
  rescue ActiveRecord::RecordInvalid => e
    e.record.errors.each { |attr, msg| errors.add(attr, msg) }

    false
  end

  def brand_create
    Brand.create!(name:)
  end
end
