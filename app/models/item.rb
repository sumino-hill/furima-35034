class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :explain
    validates :category_id
    validates :state_id
    validates :cost_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
    validates :user, foreign_key:true
  end
end
