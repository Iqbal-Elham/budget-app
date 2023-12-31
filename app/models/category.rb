class Category < ApplicationRecord
  belongs_to :user
  has_many :category_expenses
  has_many :expenses, through: :category_expenses

  validates_presence_of :user
  validates :name, presence: true
  validates :icon, presence: true

  validates :name, presence: true, length: { minimum: 3, maximum: 30 }
  validates :icon, presence: true
end
