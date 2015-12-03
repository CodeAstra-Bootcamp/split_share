# == Schema Information
#
# Table name: expenses
#
#  id         :integer          not null, primary key
#  title      :string
#  amount     :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Expense < ActiveRecord::Base
  belongs_to :group

  validates :title, presence: true
  validates :amount, presence: true,
            numericality: {greater_than: 0, only_integer: true}
end
