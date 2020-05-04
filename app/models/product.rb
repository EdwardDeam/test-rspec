class Product < ApplicationRecord
  validates :name, presence: true, length: { in: 5..29 }
  validates :category, presence: true, length: { minimum: 5, maximum: 24}
  validates :price, presence: true, numericality: { greater_than: 0 }

  def display_currency
    '$' + sprintf('%.2f', (self.price / 100.0))
  end
end
