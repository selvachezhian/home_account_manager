class CreateDefaultExpenditures < ActiveRecord::Migration
  def change
    create_table :default_expenditures do |t|
      t.string :name
      t.integer :user_id, index: true, default: 0

      t.timestamps null: false
    end
  end
end
