require 'rails_helper'
RSpec.describe Deal, type: :model do
  it 'Valid if name is present' do
    @user = User.create!(name: 'tufahel', email: 'tufahel96@gmail.com', password: 1_234_567)
    @deal = Deal.create(name: 'goods', amount: 200.00, author_id: @user.id)
    expect(@deal).to be_valid
  end

  it 'Invalid if name is absent' do
    @user = User.create!(name: 'tufahel', email: 'tufahel96@gmail.com', password: 1_234_567)
    @deal = Deal.create(amount: 200.00, author_id: @user.id)
    expect(@deal).to be_valid
  end

  it 'Invalid if amount is absent' do
    @user = User.create!(name: 'tufahel', email: 'tufahel96@gmail.com', password: 1_234_567)
    @deal = Deal.create(name: 'goods', author_id: @user.id)
    expect(@deal).to_not be_valid
  end

  it 'must be associated with a category' do
    @user = User.create!(name: 'tufahel', email: 'tufahel96@gmail.com', password: 1_234_567)
    @category = Category.create(name: 'Bitcoin', icon: 'www.ubuntu.com', author_id: @user.id)
    @deal = Deal.create(name: 'goods', amount: 200.00, author_id: @user.id)
    @category_deal = @deal.category_deals.create(deal_id: @deal.id, category_id: @category.id)
    expect(@category_deal).to be_valid
  end
end
