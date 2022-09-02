class Restaurant < ApplicationRecord
  belongs_to :category
  validates :name, presence: true
  validates :address, presence: true
end
