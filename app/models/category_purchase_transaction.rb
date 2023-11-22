class CategoryPurchaseTransaction < ApplicationRecord
  belongs_to :group_transaction
  belongs_to :money_transaction
end
