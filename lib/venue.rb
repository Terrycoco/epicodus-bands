class Venue < ActiveRecord::Base
  has_many :bands, :through => :gigs
  has_many :gigs
  validates :venue_name, presence: true, uniqueness: true
  before_save :capitalize

  private
  define_method (:capitalize) do
    self.venue_name[0] = self.venue_name[0].capitalize
  end
end
