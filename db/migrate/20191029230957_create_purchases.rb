class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :unicorns_listing, foreign_key: true
      t.references :buyer_balance, references: :balances, foreign_key: { to_table: :balances}
      t.references :seller_balance, references: :balances, foreign_key: { to_table: :balances}

      t.timestamps
    end
  end
end
