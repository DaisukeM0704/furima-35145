class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :cost
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :delivery_time
  
  with_options presence: true do
    validates :image
    validates :name
    validates :introduction
    validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters." }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :prefecture_id
    validates :delivery_time_id
  end
end