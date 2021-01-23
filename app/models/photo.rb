class Photo < ApplicationRecord
  belongs_to :user
  has_many :photo_tags
  has_many :tags, through: :photo_tags
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :tag_ids , presence: { message: 'を選択してください' }
    validates :image , presence: { message: 'を選択してください' }
   end
end