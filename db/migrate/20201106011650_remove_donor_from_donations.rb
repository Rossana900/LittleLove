class RemoveDonorFromDonations < ActiveRecord::Migration[5.0]
  def change
    remove_reference :donations, :donor, index: true, foreign_key: true
  end
end
