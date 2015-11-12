class CreateSecrets < ActiveRecord::Migration
  def change
    create_table :secrets do |t|
      t.integer :user_id, index: true
      t.string :name
      t.timestamps null: false
    end
  end
end
