class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :ownership_type
end
