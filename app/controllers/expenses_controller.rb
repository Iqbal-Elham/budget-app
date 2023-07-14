class ExpensesController < ApplicationController
  before_action :set_category
  before_action :set_expense, only: %i[ show destroy ]
  before_action :authenticate_user!

  def index
    @expenses = @category.expenses.order(created_at: :desc)
  end

  # GET /expenses/new
  def new
    @expense = @category.expenses.new
  end

  # POST /expenses or /expenses.json
  def create
    @expense = Expense.new(user: current_user, **expense_params)

    if @expense.save
      @category.expenses << @expense
      redirect_to category_expenses_url(@category, @expense), notice: 'Expense was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_expense
    @expense = @category.expenses.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:name, :amount, :user_id)
    end
end
