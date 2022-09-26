require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'should pass if all four fields are set' do
      @category = Category.new(name: 'Succulents')
      @product = Product.new(name: 'Painted-Lady', price_cents: 39.99, quantity: 99, category: @category)
      expect(@product).to be_valid
    end
    
    it 'should not pass if the name field is nil' do
      @category = Category.new(name: 'Succulents')
      @product = Product.new(name: nil, price_cents: 39.99, quantity: 99, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
    end

    it 'should not pass if the price field is nil' do
      @category = Category.new(name: 'Succulents')
      @product = Product.new(name: 'Painted-Lady', price_cents: nil, quantity: 99, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
    end

    it 'should not pass if the quantity field is nil' do
      @category = Category.new(name: 'Succulents')
      @product = Product.new(name: 'Painted-Lady', price_cents: 39.99, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
    end

    it 'should not pass if the category field is nil' do
      @category = Category.new(name: 'Succulents')
      @product = Product.new(name: 'Painted-Lady', price_cents: 39.99, quantity: 99, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to be_present
    end

  end
end