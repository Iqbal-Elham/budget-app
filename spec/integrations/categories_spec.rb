require 'rails_helper'

RSpec.describe 'Categories', type: :system do
  describe 'index page' do
    include Devise::Test::IntegrationHelpers
    before(:each) do
      @user = User.create(name: 'iqbal', email: 'iqbal@gmail.com', password: '123456')
      Category.create(name: 'Health', icon: 'icon')
      Category.create(name: 'Food', icon: 'icon')
      Category.create(name: 'Education', icon: 'icon')
      login_as(@user, scope: :user)
      visit categories_path
    end

    let(:categories) { Category.all }

    it 'should display the name' do
      categories.each do |category|
        expect(page).to have_content(category.name)
      end
    end

    it 'should display the icon' do
      categories.each do |category|
        expect(page).to have_css("img[src*='#{category.icon}']")
      end
    end
  end
end
