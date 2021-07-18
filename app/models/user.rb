class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[0-9])[a-z0-9]+\z/i,
                                 message: 'is invalid. Include both letters and numbers' }
  with_options presence: true do
    validates :nickname
    validates :user_birthday
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶ一]+\z/, message: 'is invalid. Input full-width katakana characters' } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end

  has_many :items
  has_many :orders
end
