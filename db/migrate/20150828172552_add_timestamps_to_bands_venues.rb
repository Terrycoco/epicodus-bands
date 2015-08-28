class AddTimestampsToBandsVenues < ActiveRecord::Migration
  def change
   add_timestamps(:bands)
   add_timestamps(:venues)
  end
end
