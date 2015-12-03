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
    @membership = @group.memberships.where(user_id: current_user.id).first
    @members = @group.members
    @shares = @membership.expense_shares.for_display.all
    @expenses = Expense.where(id: @shares.collect(&:expense_id)).group_by(&:id)
    @creators = User.where(id: @expenses.values.flatten.collect(&:creator_id)).group_by(&:id)

    @expense = @group.expenses.new
    @group_membership = @group.memberships.new
  end

private
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
