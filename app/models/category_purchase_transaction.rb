class CategoryPurchaseTransaction < ApplicationRecord
  belongs_to :money_transactions
  belongs_to :group_transactions
end
