class CreateExpenseShares < ActiveRecord::Migration
  def change
    create_table :expense_shares do |t|
      t.references :expense, index: true, foreign_key: true
      t.references :group_membership, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
