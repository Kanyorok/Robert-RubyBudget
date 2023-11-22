require 'rails_helper'

RSpec.describe CategoryPurchaseTransaction, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(full_name: 'User')
    money_transaction = MoneyTransaction.create(name: 'Test Purchase', amount: 100.60)
    group_transaction = GroupTransaction.new(name: 'Test Category', icon: 'test_icon', user:)
    cat_pur = CategoryPurchaseTransaction.new(money_transaction:, group_transaction:)
    expect(cat_pur).to be_valid
  end

  it 'is not valid without a valid purchase' do
    user = User.new(full_name: 'User')
    group_transaction = GroupTransaction.new(name: 'Test Category', icon: 'test_icon', user:)
    cat_pur = CategoryPurchaseTransaction.new(group_transaction:)
    expect(cat_pur).to_not be_valid
  end

  it 'is not valid without a valid category' do
    User.new(full_name: 'User')
    money_transaction = MoneyTransaction.create(name: 'Test Purchase', amount: 100)
    cat_pur = CategoryPurchaseTransaction.new(money_transaction:)
    expect(cat_pur).to_not be_valid
  end
end
