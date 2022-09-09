class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_deals, dependent: :destroy
  has_many :deals, through: :category_deals, dependent: :destroy

  validates :name, presence: true
end
