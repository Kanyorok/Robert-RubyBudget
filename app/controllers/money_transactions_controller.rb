class MoneyTransactionsController < ApplicationController
  def new
    @purchase = MoneyTransactions.new
    @category = GroupTransaction.find(params[:group_transaction_id])
    @user = User.includes(:group_transactions).find(current_user.id)
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.author_id = current_user.id
    @category = Category.find(params[:category_id])

    if @purchase.save
      selected_category_ids = params[:purchase][:category_ids]
      if selected_category_ids
        selected_category_ids.each do |category_id|
          CategoryPurchase.create(purchase_id: @purchase.id, category_id:)
        end

        redirect_to category_path(selected_category_ids[0]), notice: 'Purchase added'
      else
        redirect_to category_path(@category), notice: 'You must select at least one category, try again'
      end
    else
      render :new
    end
  end
    
      private
    
      def purchase_params
        params.require(:purchase).permit(:amount, :name)
      end
end
