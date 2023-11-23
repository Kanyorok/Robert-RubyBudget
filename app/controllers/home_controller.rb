class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @group_transactions = GroupTransaction.all
    @user = current_user
  end
end
