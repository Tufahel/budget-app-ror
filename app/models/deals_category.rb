class DealsCategory < ApplicationRecord
  belongs_to :category
  belongs_to :deal
end
