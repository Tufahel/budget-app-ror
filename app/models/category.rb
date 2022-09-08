class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :deals, through: :deals_categories

  validates :name, presence: true
end
