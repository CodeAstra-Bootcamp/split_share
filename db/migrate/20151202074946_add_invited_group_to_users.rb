class AddInvitedGroupToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :invited_group, index: true, foreign_key: true
  end
end
