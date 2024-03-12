class Profile < ApplicationRecord
  belongs_to :user

  # TODO: Make sure user_id is unique to avoid creating multiple profiles for same user.

  has_one_attached :picture
end
