FactoryBot.define do
  factory :item do
    name { 'test' }
    description { 'テスト投稿' }
    category_id { 1 }
    condition_id { 1 }
    shipping_fee_status_id { 1 }
    prefecture_id { 1 }
    shipping_duration_id { 1 }
    price { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
