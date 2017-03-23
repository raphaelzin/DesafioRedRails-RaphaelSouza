class Room < ApplicationRecord

geocoded_by :address
after_validation :geocode

  belongs_to :user
  has_many :requests
  has_many :pictures, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  validates :address, presence: true
  validates :desc, presence: true
  validates :guests, numericality: { only_integer: true }
  validates :beds,  numericality: { only_integer: true }
  validates :price, presence: true

end
