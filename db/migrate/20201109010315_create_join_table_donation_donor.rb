class CreateJoinTableDonationDonor < ActiveRecord::Migration[5.0]
  def change
    create_join_table :donations, :donors do |t|
       t.integer :donation_id
       t.integer :donor_id
       t.boolean :purchased
    end
  end
end
