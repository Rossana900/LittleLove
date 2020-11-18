class AddPriceToDonations < ActiveRecord::Migration[5.0]
  def change
    add_column :donations, :price, :string
  end
end
