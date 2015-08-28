class CreateGigs < ActiveRecord::Migration
  def change
    create_table(:gigs) do |t|
      t.column(:band_id, :integer)
      t.column(:venue_id, :integer)
      t.column(:gig_date, :datetime)

      t.timestamps
    end
  end
end
