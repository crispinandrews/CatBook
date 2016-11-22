class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if @user.persisted?
      ApplicationMailer.send_new_user_message(@user).deliver
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :petname, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email, :petname, :password, :password_confirmation, :current_password)
  end
end
