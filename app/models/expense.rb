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

  has_many :shares, class_name: ExpenseShare.name, dependent: :destroy

  validates :title, presence: true
  validates :bill_date, presence: true
  validates :amount, presence: true,
            numericality: {greater_than: 0, only_integer: true}

  after_create :share_expense

private
  def share_expense
    members_count = self.group.memberships.count
    self.group.memberships.each do |membership|
      es = self.shares.new
      es.group_membership = membership
      es.amount = self.amount / members_count
      es.save!
    end
  end
end
