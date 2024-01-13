class GroupTransactionsController < ApplicationController
  before_action :authenticate_user!
  def show
    @category = GroupTransaction.includes(:money_transactions).find(params[:id])
    @total = 0

    @category.money_transactions.each do |p|
      @total += p.amount
    end
  end

  def create
    @category = GroupTransaction.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to authenticated_root_path, notice: 'Category added'
    else
      render :new
    end
  end

  private

  def category_params
    params.permit(:name, :icon, :desc)
  end
end
