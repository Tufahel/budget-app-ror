class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_deals, dependent: :destroy
  has_many :categories, through: :category_deals, dependent: :destroy

  validates :amount, presence: true
end
