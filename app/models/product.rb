class Product < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
  #, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :sort
  has_many :order_products
  has_many :orders, through: :order_products
  validates :name, presence: true, length: {minimum: 2, maximum: 20}
  validates :price, presence: true, numericality: true
  #validates :sort_id, presence: true
end