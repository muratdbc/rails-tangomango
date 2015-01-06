class Event < ActiveRecord::Base
  scope :find_area, ->(venue_area) { where('area = ?', venue_area) }
  has_many :categories
  belongs_to :user
end
