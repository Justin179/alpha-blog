class Product < ActiveRecord::Base
  has_many :order_products
  has_many :orders, through: :order_products
  validates :name, presence: true, length: {minimum: 2, maximum: 20}
  validates :price, presence: true, numericality: true
end