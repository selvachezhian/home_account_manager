describe Expenditure, type: :model do
  it { should belong_to(:default_expenditure) }
  it { should belong_to(:user) }
end