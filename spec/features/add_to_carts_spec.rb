require 'rails_helper'

RSpec.feature "User adds product to cart", type: :feature, js: true do
      # SETUP
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
  end

  scenario 'user clicks add to cart button' do
    visit '/'
    first('article').find('footer').first('a').click
    sleep(3)
    save_screenshot
    expect(page).to have_content('My Cart (1)')
  end
end
