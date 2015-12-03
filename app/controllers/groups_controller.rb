class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.admin = current_user
    if @group.save
      redirect_to @group
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @members = @group.members
    @expenses = @group.expenses.for_display.all
    @expense = @group.expenses.new
    @group_membership = @group.memberships.new
  end

private
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
