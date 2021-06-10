FactoryBot.define do
  factory :purchase_address do
    postal_code                    {"999-9999"}
    prefecture_id {1}
    city         { "北九州市" }
    addresses    {"青山１−１−１"}
    building     {""}
    phone_number {"09009090909"}

    association :user_id, factory: :user
    association :item_id, factory: :user
  end
end