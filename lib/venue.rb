class Venue < ActiveRecord::Base
  has_many :bands, :through => :gigs
  has_many :gigs
  validates :venue_name, uniqueness: true
  before_save :capitalize

  private
  define_method (:capitalize) do
    self.venue_name = self.venue_name.capitalize
  end
end
