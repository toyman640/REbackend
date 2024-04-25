class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :ownership_type
  has_many_attached :images

  validates :title, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
end
