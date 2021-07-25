class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[0-9])[a-z0-9]+\z/i,
                                 message: 'は半角英数字を含めて設定してください', allow_blank: true }
  with_options presence: true do
    validates :nickname
    validates :user_birthday
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角で入力してください', allow_blank: true } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶ一]+\z/, message: 'は全角カタカナで入力してください', allow_blank: true } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end

  has_many :items
  has_one :address
end
