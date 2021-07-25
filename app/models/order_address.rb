class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :prefecture_id, numericality: { other_than: 0, message: 'を入力してください' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を含めて正しく入力してください', allow_blank: true }
    validates :prefecture_id, numericality: { other_than: 0, message: 'を入力してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'を正しく入力してください', allow_blank: true }
    validates :token, presence: { message: 'が正しく入力されていません' }
  end

  def save
    Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                   phone_number: phone_number, user_id: user_id)
  end
end
