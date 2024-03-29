class MoneyTransaction < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :category_purchase_transaction, foreign_key: :money_transaction_id
  has_many :group_transaction, through: :category_purchase_transaction
end
