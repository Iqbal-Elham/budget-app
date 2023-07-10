class Category < ApplicationRecord
  belongs_to :user
  # has_many :category_product
  # has_many :product, through: :category_product

  validates_presence_of :user
  validates :name, presence: true
  validates :icon, presence: true

  # def total_amount
  #   total = 0
  #   product.each do |product|
  #     total += product.amount
  #   end
  #   total
  # end
end
