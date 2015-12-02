# == Schema Information
#
# Table name: group_memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GroupMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  attr_accessor :email

  validates :user_id, presence: true
  validates :group_id, presence: true, uniqueness: {scope: :user_id}
end
