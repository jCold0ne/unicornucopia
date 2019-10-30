class CreateUnicornUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :unicorns_users do |t|
      t.references :unicorn, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
