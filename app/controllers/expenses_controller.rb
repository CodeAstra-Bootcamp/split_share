class ExpensesController < ApplicationController
  def create
    group = Group.find(params[:group_id])
    expense = group.expenses.new(expense_params)
    expense.creator = current_user
    if expense.save
      flash[:notice] = "Expense Tracked Successfully"
    else
      flash[:alert] = "Couldn't track the expense: #{expense.errors.full_messages.join(', ')}"
    end

    redirect_to group
  end

private
  def expense_params
    params.require(:expense).permit(:title, :amount, :bill_date)
  end
end
