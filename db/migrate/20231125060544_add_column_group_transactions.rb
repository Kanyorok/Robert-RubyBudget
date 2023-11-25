class AddColumnGroupTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :group_transactions, :desc, :text
  end
end
