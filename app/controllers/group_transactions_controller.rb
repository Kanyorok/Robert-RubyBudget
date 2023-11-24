class GroupTransactionsController < ApplicationController
  def show
    @category = GroupTransaction.includes(:purchases).find(params[:id])
    @total = 0

    @category.purchases.each do |p|
      @total += p.amount
    end
  end

  def create
    @category = GroupTransaction.new(category_params)
    @category.user_id = current_user.id
    if @category.save
      redirect_to root_path, notice: 'Category added'
    else
      render :new
    end
  end

  private

  def category_params
    params.permit(:name, :icon)
  end
end
