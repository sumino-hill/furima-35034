class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :name
    validates :explain
    validates :category_id
    validates :state_id
    validates :cost_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
    validates :user
  end
end
