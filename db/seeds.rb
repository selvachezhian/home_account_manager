# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

DefaultExpenditure.transaction do

  %w(Petrol Vegetables EB Water Telephone Inter\ Net Gas Grocery Milk Food).each do |exp|
    DefaultExpenditure.create!(name: exp, user_id: 0)
  end

end
