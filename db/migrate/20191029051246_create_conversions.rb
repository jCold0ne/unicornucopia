class CreateConversions < ActiveRecord::Migration[5.2]
  def change
    create_table :conversions do |t|
      t.integer :aud
      t.string :stripe_id
      t.references :balance, foreign_key: true

      t.timestamps
    end
  end
end
