class Band < ActiveRecord::Base
  has_many :venues, :through => :gigs
  has_many :gigs
end
