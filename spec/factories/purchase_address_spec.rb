FactoryBot.define do
  factory :purchase_address do
    postal_code                    {"999-9999"}
    prefecture_id {1}
    city         { "北九州市" }
    addresses    {"青山１−１−１"}
    building     {"建物"}
    phone_number {"09009090909"}
    token        {"tok_abcdefghijk00000000000000000"}
    user_id      {0}
    item_id      {0}
  end
end