class CreateJoinTableDonationDonor < ActiveRecord::Migration[5.0]
  def change
    create_join_table :donations, :donors do |t|
      # t.index [:donation_id, :donor_id]
       t.index [:donor_id, :donation_id]
       t.boolean :purchased
    end
  end
end
