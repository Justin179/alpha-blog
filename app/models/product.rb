class Product < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 2, maximum: 20}
  validates :price, presence: true, numericality: true
end