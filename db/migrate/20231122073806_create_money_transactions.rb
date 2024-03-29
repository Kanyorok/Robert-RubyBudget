class CreateMoneyTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :money_transactions do |t|
      t.string :name
      t.float :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
