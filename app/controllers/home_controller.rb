class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user
      # Retrieve the user along with their associated categories and purchases.
      @user = User.includes(group_transactions: :money_transactions).find(current_user.id)
      @totals = []
      @user.group_transactions.each do |categ|
        total_amt = 0
        categ.money_transactions.each do |purch|
          total_amt += purch.amount
        end
        @totals << total_amt
      end
    else
      redirect_to new_user_session_path, notice: 'Please sign in to view your categories.'
    end
  end

  def create
    @category = GroupTransaction.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to categories_path, notice: 'Category added'
    else
      render :new
    end
  end

  private

  def category_params
    params.permit(:name, :icon)
  end
end
