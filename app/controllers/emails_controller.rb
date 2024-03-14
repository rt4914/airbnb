class EmailsController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update!(user_params)
      redirect_to edit_email_path, notice: 'Email updated successfully'
    else
      redirect_back fallback_location: edit_email_path, alert: 'Failed to update email'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
