class CategoryPurchaseTransaction < ApplicationRecord
  belongs_to :money_transaction
  belongs_to :group_transaction
end
