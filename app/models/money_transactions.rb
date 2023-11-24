class MoneyTransactions < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :group_transactions, through: :category_purchase_transactions
  has_many :category_purchase_transactions, foreign_key: :money_transaction_id
end
