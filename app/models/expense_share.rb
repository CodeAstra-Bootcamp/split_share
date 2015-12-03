class ExpenseShare < ActiveRecord::Base
  belongs_to :expense
  belongs_to :group_membership
end
