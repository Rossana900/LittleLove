class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.string :product_name
      t.integer :product_count
      t.references :donor, foreign_key: true

      t.timestamps
    end
  end
end
