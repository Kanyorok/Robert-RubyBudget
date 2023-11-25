class MoneyTransactionsController < ApplicationController
  def new
    @purchase = MoneyTransactions.new
    @category = GroupTransaction.find(params[:group_transaction_id])
    @user = User.includes(:group_transactions).find(current_user.id)
  end

  def create
    @purchase = MoneyTransactions.new(purchase_params)
    @purchase.user_id = current_user.id
    @category = GroupTransaction.find(params[:group_transaction_id])

    if @purchase.save
      selected_group_ids = params[:money_transaction][:group_transaction_ids]
      if selected_group_ids
        selected_category_ids.each do |category_id|
            CategoryPurchase.create(money_transaction_id: @purchase.id, category_id:)
          end

        redirect_to group_transaction_path(selected_group_ids[0]), notice: 'Purchase added'
      else
        redirect_to group_transaction_path(@category), notice: 'You must select at least one category, try again'
      end
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:money_transaction).permit(:amount, :name)
  end
end
