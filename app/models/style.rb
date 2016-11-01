class Style < ActiveRecord::Base
  before_save :save_slug

  validates :name, presence: true, uniqueness: true
  # validates :slug, presence: true, uniqueness: true
  has_many :beers

  def save_slug
    self.slug = name.parameterize
  end

end
