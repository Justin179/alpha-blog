class Order < ActiveRecord::Base
  has_many :products
  belongs_to :user
  validates :user_id, presence: true
end