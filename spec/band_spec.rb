require('spec_helper')

describe (Band) do

  describe('create a band and add venue through a gig ') do
    it('creates a band, a venue and a gig') do
      test_band = Band.create({:band_name => 'Aerosmith'})
      test_venue = Venue.create({:venue_name => 'The Roxy'})
      test_band.gigs << Gig.new({:venue => test_venue, :gig_date => '1999-01-01 14:30'})
      expect(test_band.venues).to(eq([test_venue]))

    end

  end

  describe('tests validation for uniqueness ') do
    it('creates a band and ensures no duplication') do
      test_band1 = Band.create({:band_name => 'Aerosmith'})
      test_band2 = Band.create({:band_name => 'Aerosmith'})
      expect(Band.all).to(eq([test_band1]))

    end

  end



end
