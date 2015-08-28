require 'bundler/setup'
Bundler.require :default

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

#bands
get('/') do
  @bands = Band.all
  erb(:bands)
end

post('/bands/new') do
  Band.create({:band_name => params.fetch("band_name")})
  redirect('/')
end

get('/bands/:bid/edit') do
  @band = Band.find(params.fetch('bid'))
  @venues = Venue.all
  erb(:band_edit)
end

post('/bands/:bid/update') do
  bid = params.fetch('bid')
  band = Band.find(bid)
  new_name = params.fetch('band_name')
  band.update({:band_name => new_name})
  redirect("/bands/#{bid}/edit")
end

post('/bands/:bid/gig/add') do
  bid = params.fetch('bid')
  band = Band.find(bid)
  venue = Venue.find(params.fetch('venue_id'))
  gig_date = params.fetch("gig_date")
  band.gigs << Gig.new({:venue => venue, :gig_date => gig_date})
  redirect("/bands/#{bid}/edit")
end

get('/bands/:bid/gig/:gid/delete') do
  bid = params.fetch('bid')
  gig = Gig.find(params.fetch('gid'))
  gig.destroy()
  redirect("/bands/#{bid}/edit")
end

#venues
get('/venues') do
  @venues = Venue.all
  erb(:venues)
end

post('/venues/new') do
  Venue.create({:venue_name => params.fetch("venue_name")})
  redirect('/venues')
end

get('/venues/:vid/edit') do
  @venue = Venue.find(params.fetch('vid'))
  @bands = Band.all
  erb(:venue_edit)
end

post('/venues/:vid/gig/add') do
  vid = params.fetch('vid')
  venue = Venue.find(vid)
  band = Band.find(params.fetch('band_id'))
  gig_date = params.fetch("gig_date")
  band.gigs << Gig.new({:venue => venue, :gig_date => gig_date})
  redirect("/venues/#{vid}/edit")
end

get('/venues/:vid/gig/:gid/delete') do
  vid = params.fetch('vid')
  gig = Gig.find(params.fetch('gid'))
  gig.destroy()
  redirect("/venues/#{vid}/edit")
end
