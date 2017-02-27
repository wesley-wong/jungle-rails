require 'rails_helper'

RSpec.feature "User should be able to login", type: :feature, js: true do
    before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

    @user = User.create!(
      first_name: 'Bat',
      last_name: 'Man',
      email: 'bat@man.com',
      password: 'batman',
      password_confirmation: 'batman'
    )
  end

  scenario 'user logs in, and shows name in header after redirect' do

    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'bat@man.com'
      fill_in id: 'password', with: 'batman'

      click_button 'Submit'
    end

    sleep(3)
    save_screenshot
    expect(page).to have_content("Hello, #{@user.first_name}")
  end
end
