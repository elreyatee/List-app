class Item < ActiveRecord::Base

  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  belongs_to :list
  has_many :item_categories
  has_many :categories, through: :item_categories

  validates :name, presence: true
  validates :description, presence: true
  validates :qty, presence: true
end
