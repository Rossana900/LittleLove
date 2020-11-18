class AddCountToDonationsDonors < ActiveRecord::Migration[5.0]
  def change
    add_column :donations_donors, :count, :integer
  end
end
