require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(name: 'iqbal', email: 'iqbal@test.com', password: '123456')
    expect(@user).to be_valid
    @category = Category.create(name: 'Category', icon: 'icon', user: @user)
  end

  it 'should be valid with valid attributes' do
    expect(@category).to be_valid
  end

  it 'should not be valid without a name' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'should not be valid without an icon' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end
end