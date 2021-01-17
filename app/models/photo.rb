class Photo < ApplicationRecord
  has_many :photo_tags
  has_many :tags, through: :photo_tags
  has_one_attached :image
end