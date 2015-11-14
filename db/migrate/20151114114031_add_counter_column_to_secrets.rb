class AddCounterColumnToSecrets < ActiveRecord::Migration
  def change
    add_column :secrets, :secret_values_count, :integer, default: 0
  end
end
