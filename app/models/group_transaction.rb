class GroupTransaction < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :icon, presence: true

  has_many :category_purchase_transactions
  has_many :money_transactions, through: :category_purchase_transactions
end
