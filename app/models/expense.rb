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
#

class Expense < ActiveRecord::Base
  belongs_to :group
  belongs_to :creator, class_name: User.name

  validates :title, presence: true
  validates :amount, presence: true,
            numericality: {greater_than: 0, only_integer: true}
end
