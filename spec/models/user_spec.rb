require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'User', email: 'iqbal@test.com', password: '123456')
  end

  it 'should valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'should not be valid without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'should not be valid without an email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end
end
