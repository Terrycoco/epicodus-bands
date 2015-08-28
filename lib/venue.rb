class Venue < ActiveRecord::Base
  has_many :bands, :through => :gigs
  has_many :gigs
end
