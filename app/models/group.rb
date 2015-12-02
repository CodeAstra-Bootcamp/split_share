# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  admin_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ActiveRecord::Base
  belongs_to :admin, class_name: User.name
  has_many :memberships, class_name: GroupMembership.name
  has_many :users, through: :memberships

  validates :name,        presence: true
  validates :description, presence: true

  def add(usr)
    gm = self.memberships.new
    gm.user = usr
    gm.save!
  end
end
