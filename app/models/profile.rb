class Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :picture

  before_validation :set_default_picture, on: :create

  alias owner user
  alias avatar picture

  private

  def set_default_picture
    return if picture.attached?

    picture.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avatar.jpeg')),
                    filename: 'default_avatar.jpeg',
                    content_type: 'image/jpeg')
  end
  
end
