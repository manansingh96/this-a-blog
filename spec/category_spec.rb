# frozen_string_literal: true

require 'rails_helper'

describe 'Category' do
  before do
    @category = Category.new(name: 'sports')
  end

  it 'should be valid' do
    expect(@category).to be_valid
  end

  it 'should be present' do
    @category.name = ' '
    expect(@category).to be_invalid
  end

  it 'should be unique' do
    @category.save
    @category2 = Category.new(name: 'Sports')
    expect(@category2).to_not be_valid
  end

  it 'should not be too long' do
    @category.name = 'z' * 22
    expect(@category).to be_invalid
  end

  it 'should not be too short' do
    @category.name = 'zz'
    expect(@category).to be_invalid
  end
end
