class Band < ActiveRecord::Base
  has_many :venues, :through => :gigs
  has_many :gigs
  validates :band_name, presence: true, uniqueness: true
end
