class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_properties, through: :wishlists, source: :property, dependent: :destroy

  has_many :reservations, dependent: :destroy
  has_many :reserved_properties, through: :reservations, source: :property, dependent: :destroy 

  has_many :payments, through: :reservations, dependent: :destroy

  after_create :new_profile

  delegate :name, :address_1, :address_2, :city, :state, :country, :avatar, to: :profile

  def new_profile
    self.profile = Profile.new
    save!
  end
end
