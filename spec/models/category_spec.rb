require 'rails_helper'
RSpec.describe Category, type: :model do
  it 'valid if name is present' do
    @user = User.create!(name: 'tufahel', email: 'tufahel96@gmail.com', password: 1_234_567)
    @category = Category.create(name: 'Bitcoin', icon: 'www.ubuntu.com', author_id: @user.id)
    expect(@category).to be_valid
  end

  it 'invalid if name absent' do
    @user = User.create!(name: 'tufahel', email: 'tufahel96@gmail.com', password: 1_234_567)
    @category = Category.create(icon: 'www.ubuntu.com', author_id: @user.id)
    expect(@category).to_not be_valid
  end

  it 'Must be associated with a user' do
    @category = Category.create(name: 'Bitcoin', icon: 'www.ubuntu.com')
    expect(@category).to_not be_valid
  end

  it 'valid if User present' do
    @user = User.create!(name: 'tufahel', email: 'tufahel96@gmail.com', password: 1_234_567)
    @category = Category.create(name: 'Bitcoin', icon: 'www.ubuntu.com', author_id: @user.id)
    expect(@category).to be_valid
  end

  it 'Must have an icon' do
    @user = User.create!(name: 'tufahel', email: 'tufahel96@gmail.com', password: 1_234_567)
    @category = Category.create(name: 'Bitcoin', icon: 'www.ubuntu.com', author_id: @user.id)
    expect(@category).to be_valid
  end

  it 'invalid if icon is absent' do
    @user = User.create!(name: 'tufahel', email: 'tufahel96@gmail.2com', password: 1_234_567)
    @category = Category.create(name: 'Bitcoin', author_id: @user.id)
    expect(@category).to_not be_valid
  end
end
