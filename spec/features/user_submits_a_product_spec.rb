require 'rails_helper'

RSpec.feature 'User submits a product' do
  scenario 'they see the page for the submitted product' do
    # Variable setup
    product_name = 'Capybara Test'
    product_category = 'Widget'
    product_price = 1000
    Store.create(name: 'Test Store')
    user = User.create(username: 'estet', email: 'sdfa@saf.com', password: '123456')
    login_as(user, scope: :user)
    # Capybara instructions
    visit root_path
    click_on 'Add a new product'
    fill_in 'product_name', with: product_name
    fill_in 'product_category', with: product_category
    fill_in 'product_price', with: product_price
    first('input#product_store_id', visible: false).set("#{Store.first.id}")
    click_on 'Submit'

    # Assertion
    expect(page).to have_content(product_name)
  end
end 

# As a User
# When I visit the home page
# And I click "Create New Product"
# And I fill in the name, category, and price
# And I click "Submit"
# Then I should see the name on the page