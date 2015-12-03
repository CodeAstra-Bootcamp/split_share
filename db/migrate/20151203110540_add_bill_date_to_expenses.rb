class AddBillDateToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :bill_date, :date
  end
end
