class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :cost
  belongs_to :shipping_day
  belongs_to :state
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  with_options presence: true do
    validates :image
    validates :name
    validates :explain
    validates :category_id
    validates :state_id
    validates :cost_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price, numericality: {greater_than: 299,less_than: 10000000}
  end
end
