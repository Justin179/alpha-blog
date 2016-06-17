class Order < ActiveRecord::Base
  has_many :products
  has_many :order_details
  belongs_to :user
  validates :user_id, presence: true
end