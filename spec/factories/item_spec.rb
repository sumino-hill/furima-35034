FactoryBot.define do
  factory :item do
    name                    {Faker::Name.initials(number: 2)}
    explain                 {'aaaaaa'}
    category_id {1}
    state_id {1}
    cost_id {1}
    prefecture_id {1}
    shipping_day_id {1}
    price {1}
    after(:build) do |item|
      item.image.attach(io: File.open('/Users/suminotaisei/projects/furima-35034/app/assets/images/search.png'), filename: 'star.png', content_type: 'image/png')
    end
    association :user, factory: :user
  end
end
