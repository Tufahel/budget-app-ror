class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :deals_categories, dependent: :destroy
  has_many :categories, through: :deals_categories

  validates :amount, presence: true
end
