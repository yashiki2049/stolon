class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字の混合で設定してください' }
         validates :name,     length: { maximum: 8 , message: 'は8文字以内で入力してください' }
         validates :text,     length: { maximum: 100 , message: 'は100文字以内で入力してください' }

         with_options presence: true do
          validates :name
          validates :text
          validates :gender
         end
end
