class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[0-9])[a-z0-9]+\z/i, message: "is invalid. Include both letters and numbers" }
  with_options presence: true do
    validates :nickname
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ , message: "is invalid. Input full-width characters"}
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ , message: "is invalid. Input full-width characters"}
    validates :last_name_kana, format: {with: /\A[ァ-ヶ一]+\z/ , message: "is invalid. Input full-width katakana characters"}
    validates :first_name_kana, format: {with: /\A[ァ-ヶ一]+\z/ , message: "is invalid. Input full-width katakana characters"}
    validates :user_birthday
  end
end
