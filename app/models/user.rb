class User < ApplicationRecord
    has_many :categories, dependent: :destroy
    has_many :deals, dependent: :destroy
end