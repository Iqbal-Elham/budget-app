require 'rails_helper'

RSpec.describe 'Transactions integration tests', type: :feature do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'iqbal', email: 'iqbal@gmail.com', password: '123456')
    @category = Category.create(name: 'Food', icon: 'icon', user_id: @user.id)

    login_as(@user, scope: :user)
  end

  describe 'new page' do
    before { visit new_category_expense_path(@category) }

    it 'should display the title "New transaction"' do
      expect(page).to have_content('New Transaction')
    end

    it 'should display a form to create a new transaction' do
      expect(page).to have_selector('form')
    end

    it 'should display a button to create the expense' do
      expect(page).to have_button('Create Transaction')
    end
  end
end