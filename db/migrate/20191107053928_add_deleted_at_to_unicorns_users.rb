class AddDeletedAtToUnicornsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :unicorns_users, :deleted_at, :datetime
    add_index :unicorns_users, :deleted_at
  end
end
