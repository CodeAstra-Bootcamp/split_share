class GroupMembershipsController < ApplicationController
  def create
    @group = Group.find(params[:group_membership][:group_id])
    usr = User.find_by(email: params[:group_membership][:email])
    if usr
      @group.add(usr)
      flash[:notice] = "Member added successfully"
    else
      # Invite the user
      # Remember the user to join the group after adding to group
      flash[:alert] = "No such user"
    end
    redirect_to @group
  end
end
