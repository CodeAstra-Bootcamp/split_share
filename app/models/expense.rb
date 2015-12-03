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
#  creator_id :integer
#  bill_date  :date
#

class Expense < ActiveRecord::Base
  belongs_to :group
  belongs_to :creator, class_name: User.name

  scope :for_display, -> {order(id: :desc)}

  validates :title, presence: true
  validates :bill_date, presence: true
  validates :amount, presence: true,
            numericality: {greater_than: 0, only_integer: true}
end
