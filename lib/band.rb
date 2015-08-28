class Band < ActiveRecord::Base
  has_many :venues, :through => :gigs
  has_many :gigs
  validates :band_name, presence: true, uniqueness: true
  before_save :capitalize

  private
  define_method (:capitalize) do
    self.band_name = self.band_name.capitalize
  end
end
