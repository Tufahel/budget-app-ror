class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :deals_categories, dependent: :destroy
  has_many :deals, through: :deals_categories
end
