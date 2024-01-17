require 'rails_helper'

RSpec.describe GroupTransaction, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(full_name: 'Test User')
    category = GroupTransaction.new(name: 'Test Category', icon: 'test_icon', author: user)
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = GroupTransaction.new(icon: 'test_icon')
    expect(category).to_not be_valid
  end

  it 'is not valid without an icon' do
    category = GroupTransaction.new(name: 'Test Category')
    expect(category).to_not be_valid
  end
end
