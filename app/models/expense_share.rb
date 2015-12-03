class ExpenseShare < ActiveRecord::Base
  belongs_to :expense
  belongs_to :group_membership

  scope :for_display, -> {order(id: :desc)}
end
