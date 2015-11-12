class CreateSecretValues < ActiveRecord::Migration
  def change
    create_table :secret_values do |t|
      t.integer :secret_id, index: true
      t.string :key
      t.string :value
      t.timestamps null: false
    end
  end
end
