class CreateUnicornsListings < ActiveRecord::Migration[5.2]
  def change
    create_table :unicorns_listings do |t|
      t.references :unicorns_user, foreign_key: true
      t.integer :buyout_price

      t.timestamps
    end
  end
end
