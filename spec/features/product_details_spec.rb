require 'rails_helper'

RSpec.feature "Visiter navigates to ProductDetails from homepage", type: :feature, js: true do

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

  scenario "They see all products on homepage" do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product', count: 10
  end

  scenario 'They click the first product' do

    visit root_path
    first('article').inspect
    first('article').find('header').first('a').click
    sleep(3)
    # save_screenshot

    expect(page).to have_content('Leave a Review')
  end

end
