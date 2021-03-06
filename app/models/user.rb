class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :photos, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字の混合で設定してください' }
         validates :name,     length: { maximum: 8 , message: 'は8文字以内で入力してください' }
         validates :text,     length: { maximum: 100 , message: 'は100文字以内で入力してください' }

         with_options presence: true do
          validates :name
          validates :text

          with_options numericality: { other_than: 0, message: 'を選択してください' } do
          validates :prefecture_id
          end
        end
end
