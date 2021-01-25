class Photo < ApplicationRecord
  belongs_to :user
  has_many :photo_tags, dependent: :destroy
  has_many :tags, through: :photo_tags
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :image , presence: { message: 'を選択してください' }
   end

   def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name: old_name)
    end

    new_tags.each do |new_name|
      new_photo_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << new_photo_tag
    end
  end
end