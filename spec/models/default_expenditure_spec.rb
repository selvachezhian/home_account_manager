require 'spec_helper'
describe DefaultExpenditure, type: :model do
  it { should have_many(:expenditures) }
  it { should belong_to(:user) }
end