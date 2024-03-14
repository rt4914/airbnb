class PasswordsController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update!(user_params)
      redirect_to edit_password_path, notice: 'Password updated successfully'
    else
      redirect_back fallback_location: edit_password_path, alert: 'Failed to update password'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password)
  end
end
