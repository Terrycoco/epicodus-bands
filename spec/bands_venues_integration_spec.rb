require('spec_helper')

describe('bands path') do

  describe('display edit page of bands', {:type => :feature}) do
    it('will display bands edit page with list of venues') do
      band = Band.create({:band_name => 'Smashing Pumpkins'})
      venue = Venue.create({:venue_name => 'Radio City Music Hall'})
      band.venues << venue
      visit('/')
      click_link('Smashing Pumpkins')
      expect(page).to have_content('Radio City Music Hall')
    end
  end

end
