class CreateCategoryPurchaseTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :category_purchase_transactions do |t|
      t.references :group_transaction, null: false, foreign_key: true
      t.references :money_transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
