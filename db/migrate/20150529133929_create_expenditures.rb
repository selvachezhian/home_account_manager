class CreateExpenditures < ActiveRecord::Migration
  def change
    create_table :expenditures do |t|
      t.string :name
      t.float :amount
      t.text :description
      t.datetime :date
      t.integer :user_id
      t.integer :created_by_id
      t.integer :updated_by_id

      t.timestamps null: false
    end

    add_index :expenditures, :user_id
    add_index :expenditures, :amount
  end
end
