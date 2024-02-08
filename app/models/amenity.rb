class Amenity < ApplicationRecord
  validates :name, presence: :true

  has_one_attached :icon
end
