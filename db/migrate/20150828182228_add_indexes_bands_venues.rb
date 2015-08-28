class AddIndexesBandsVenues < ActiveRecord::Migration
  def change
    add_index(:bands, :band_name)
    add_index(:venues, :venue_name)
  end
end
