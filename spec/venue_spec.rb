require('spec_helper')

describe (Venue) do

  describe('create a band and add venue through a gig ') do
    it('creates a band, a venue and a gig') do
      test_band = Band.create({:band_name => 'Aerosmith'})
      test_venue = Venue.create({:venue_name => 'The Roxy'})
      test_venue.gigs << Gig.new({:band => test_band, :gig_date => '1999-01-01 14:30'})
      expect(test_venue.bands).to(eq([test_band]))

    end

  end



end
