class Beer < ActiveRecord::Base
  belongs_to :style
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
end
