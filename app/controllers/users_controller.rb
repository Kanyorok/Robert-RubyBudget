class UsersController < ApplicationController
  def sign_out_user
    sign_out(current_user)
    redirect_to unauthenticated_root_path, notice: 'Signed out successfully'
  end
end
