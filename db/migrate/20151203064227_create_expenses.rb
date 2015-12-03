class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :title
      t.integer :amount
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
