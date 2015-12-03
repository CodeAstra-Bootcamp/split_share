class AddCreatorToExpenses < ActiveRecord::Migration
  def change
    add_reference :expenses, :creator, index: true, foreign_key: true
  end
end
