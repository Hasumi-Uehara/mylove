class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  with_options presence: true do
    validates :name, format: {
      with: /\A[ぁ-んァ-ン一-龥]/,
      message: "全角で入力して下さい"
    }
    validates :name_reading, format: {
      with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
      message: "全角カタカナのみで入力して下さい"
    }
    validates :nickname, length: { maximum: 40 }
    validates :profile, length: { maximum: 1000 }
  end
end
