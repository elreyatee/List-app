class List < ActiveRecord::Base
  include Sluggable

  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true

  sluggable_column  :name

  validates :name, presence: true
end
