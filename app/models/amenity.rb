class Amenity < ApplicationRecord
  validates :name, presence: :true

  has_one_attached :icon

  has_many :property_amenities, dependent: :destroy
end
