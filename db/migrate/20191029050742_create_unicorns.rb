class CreateUnicorns < ActiveRecord::Migration[5.2]
  def change
    create_table :unicorns do |t|
      t.string :name
      t.integer :original_price

      t.timestamps
    end
  end
end
