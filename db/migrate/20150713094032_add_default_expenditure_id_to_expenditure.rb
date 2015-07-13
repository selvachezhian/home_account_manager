class AddDefaultExpenditureIdToExpenditure < ActiveRecord::Migration
  def change
    add_column :expenditures, :default_expenditure_id, :integer
    add_index :expenditures, :default_expenditure_id
  end
end
