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

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
