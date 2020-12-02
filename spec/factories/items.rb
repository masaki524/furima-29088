FactoryBot.define do
  factory :item do

    association :user
    name            { "book"}
    detail          { "cooking-book" }
    price           { "1800" }

    association :category
    association :prefecture
    association :shipping_charge
    association :shipping_date
    association :status

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      item.category        = create(:category)
      item.prefecture      = create(:prefecture)
      item.shipping_charge = create(:shipping_charge)
      item.shipping_date   = create(:shipping_date)
      item.status          = create(:status)
      item.user            = create(:user)
    end
  end
end
