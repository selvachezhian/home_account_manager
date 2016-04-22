describe Expenditure, type: :model do
  it { should belong_to(:default_expenditure) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:default_expenditure_id).with_message("Type can't be blank") }
  it { should validate_presence_of(:amount) }

  it { should allow_value(1).for(:amount) }
  it { should allow_value(1.12).for(:amount) }
  it { should allow_value(21).for(:amount) }
  it { should allow_value(21.12).for(:amount) }
  it { should_not allow_value(21.123).for(:amount) }
end
