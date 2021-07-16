class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :condition_id
      validates :shipping_fee_status_id
      validates :prefecture_id
      validates :shipping_duration_id
    end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
