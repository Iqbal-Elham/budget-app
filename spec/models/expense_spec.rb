require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.create(name: 'iqbla', email: 'iqbal@test.com', password: '123456')
    expect(@user).to be_valid
    @expense = Expense.create(name: 'expense', amount: 299, user: @user)
  end

  it 'should be valid with valid attributes' do
    expect(@expense).to be_valid
  end

  it 'should not be valid without a name' do
    @expense.name = nil
    expect(@expense).to_not be_valid
  end

  it 'should not be valid without an amount' do
    @expense.amount = nil
    expect(@expense).to_not be_valid
  end
end
