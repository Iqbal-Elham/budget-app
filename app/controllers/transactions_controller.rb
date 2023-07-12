class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]

  # GET /transactions or /transactions.json
  def index
    @category = Transaction.find(params[:id])
    @transactions = @category.transaction.order(created_at: :desc)

    redirect_to new_user_session_path, notice: 'You must be logged in to access this page' unless current_user
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @category = Category.find(params[:category_id])
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(user_id: current_user.id, **transaction_params)

    respond_to do |format|
      if @transaction.save
        @category_transaction = CategoryTransaction.create(category_id: params[:category_id], transaction_id: @transaction.id)
        format.html { redirect_to transactions_path, notice: "Transaction was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:name, :amount, :user_id)
    end
end
