require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validatons' do


    describe 'Product.save' do
      it 'should should save properly' do
        @category = Category.new( name: 'Eating helpers' )
        @product = Product.new(
          name: 'HotPocket Holder',
          price: 100,
          quantity: 1,
          category: @category)
        expect(@product.save).to be true
      end

      it 'Name should be valid' do
        @category = Category.new( name: 'Eating helpers' )
        @product = Product.create(
          name: nil,
          price: 100,
          quantity: 1,
          category: @category)
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'Price should be valid' do
        @category = Category.new( name: 'Eating helpers' )
        @product = Product.create(
          name: 'HotPocket Holder',
          price: nil,
          quantity: 1,
          category: @category)
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'Quantity should be valid' do
        @category = Category.new( name: 'Eating helpers' )
        @product = Product.create(
          name: "HotPocket Holder",
          price: 100,
          quantity: nil,
          category: @category)
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end

      it 'Category should be valid' do
        @product = Product.create(
          name: nil,
          price: 100,
          quantity: 1,
          category: nil)
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

    end
  end
end
