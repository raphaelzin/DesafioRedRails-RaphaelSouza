class Room < ApplicationRecord
  belongs_to :user
  has_many :requests
  has_many :pictures
  has_many :comments
end
